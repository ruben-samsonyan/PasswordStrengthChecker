#define REGEX_PASSWORD_ONE_UPPERCASE @"^(?=.*[A-Z]).*$"  //Should contains one or more uppercase letters
#define REGEX_PASSWORD_ONE_LOWERCASE @"^(?=.*[a-z]).*$"  //Should contains one or more lowercase letters
#define REGEX_PASSWORD_ONE_NUMBER @"^(?=.*[0-9]).*$"  //Should contains one or more number
#define REGEX_PASSWORD_ONE_SYMBOL @"^(?=.*[!@#$%&_]).*$"  //Should contains one or more symbol

@interface RegExUtils : NSObject

typedef enum {
    PasswordStrengthTypeWeak,
    PasswordStrengthTypeModerate,
    PasswordStrengthTypeStrong
}PasswordStrengthType;

+ (PasswordStrengthType)checkPasswordStrength:(NSString *)password;

@end

@implementation RegExUtils

+(PasswordStrengthType)checkPasswordStrength:(NSString *)password {
    int len = password.length;
    //will contains password strength
    int strength = 0;

    if (len == 0) {
        return PasswordStrengthTypeWeak;
    } else if (len <= 5) {
        strength++;
    } else if (len <= 10) {
        strength += 2;
    } else{
        strength += 3;
    }

    strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_UPPERCASE caseSensitive:YES];
    strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_LOWERCASE caseSensitive:YES];
    strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_NUMBER caseSensitive:YES];
    strength += [self validateString:password withPattern:REGEX_PASSWORD_ONE_SYMBOL caseSensitive:YES];

    if(strength <= 3){
        return PasswordStrengthTypeWeak;
    }else if(3 < strength && strength < 6){
        return PasswordStrengthTypeModerate;
    }else{
        return PasswordStrengthTypeStrong;
    }
}

@end
