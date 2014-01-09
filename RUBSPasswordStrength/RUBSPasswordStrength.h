typedef NS_ENUM(NSInteger, RUBSPasswordStrengthType) {
  RUBSPasswordStrengthTypeWeak,
  RUBSPasswordStrengthTypeModerate,
  RUBSPasswordStrengthTypeStrong
};

@interface RUBSPasswordStrength : NSObject
+(RUBSPasswordStrengthType)checkPasswordStrength:(NSString *)password;
+(BOOL)validateString:(NSString *)string withPattern:(NSString *)pattern caseSensitive:(BOOL)caseSensitive;
@end