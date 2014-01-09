#define REGEX_PASSWORD_ONE_UPPERCASE @"^(?=.*[A-Z]).*$"  //Should contains one or more uppercase letters
#define REGEX_PASSWORD_ONE_LOWERCASE @"^(?=.*[a-z]).*$"  //Should contains one or more lowercase letters
#define REGEX_PASSWORD_ONE_NUMBER @"^(?=.*[0-9]).*$"  //Should contains one or more number
#define REGEX_PASSWORD_ONE_SYMBOL @"^(?=.*[!@#$%&_]).*$"  //Should contains one or more symbol


#import "RUBSPasswordStrength.h"

@implementation RUBSPasswordStrength

+(RUBSPasswordStrengthType)checkPasswordStrength:(NSString *)password {
  NSInteger len = password.length;
  //will contains password strength
  NSInteger strength = 0;
  
  if (len == 0) return RUBSPasswordStrengthTypeWeak;
  else if (len <= 5) strength++;
  else if (len <= 10)  strength += 2;
  else strength += 3;

  
  strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_UPPERCASE caseSensitive:YES];
  strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_LOWERCASE caseSensitive:YES];
  strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_NUMBER caseSensitive:YES];
  strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_SYMBOL caseSensitive:YES];
  
  if(strength <= 3) return RUBSPasswordStrengthTypeWeak;
  else if(3 < strength && strength < 6) return RUBSPasswordStrengthTypeModerate;
  else return RUBSPasswordStrengthTypeStrong;
}

// Validate the input string with the given pattern and
// return the result as a boolean

+(BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern caseSensitive:(BOOL)caseSensitive; {
  NSError *error = nil;
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                         options:((caseSensitive) ? 0 : NSRegularExpressionCaseInsensitive) error:&error];
  
  NSAssert(regex, @"Unable to create regular expression");
  
  NSRange textRange = NSMakeRange(0, string.length);
  NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
  
  BOOL didValidate = 0;
  
  // Did we find a matching range
  if (matchRange.location != NSNotFound) didValidate = 1;
  
  return didValidate;
}

@end
