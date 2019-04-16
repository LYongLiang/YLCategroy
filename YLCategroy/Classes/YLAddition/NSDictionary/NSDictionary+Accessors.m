//
//  ViewController.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import "NSDictionary+Accessors.h"

@implementation NSDictionary (Accessors)

- (void)setString:(NSString *)str forKey:(NSString *)key {
    if (str) {
        [self setValue:str forKey:key];
    }
}

- (BOOL)isKindOfClass:(Class)aClass forKey:(NSString *)key
{
    id value = [self objectForKey:key];
    return [value isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass forKey:(NSString *)key
{
    id value = [self objectForKey:key];
    return [value isMemberOfClass:aClass];
}

- (BOOL)isArrayForKey:(NSString *)key
{
    return [self isKindOfClass:[NSArray class] forKey:key];
}

- (BOOL)isDictionaryForKey:(NSString *)key
{
    return [self isKindOfClass:[NSDictionary class] forKey:key];
}

- (BOOL)isStringForKey:(NSString *)key
{
    return [self isKindOfClass:[NSString class] forKey:key];
}

- (BOOL)isNumberForKey:(NSString *)key
{
    return [self isKindOfClass:[NSNumber class] forKey:key];
}

- (NSArray *)arrayForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

- (NSString *)stringForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value respondsToSelector:@selector(description)]) {
        return [value description];//查看这个value的具体信息
    }
    return @"";
}

- (NSNumber *)numberForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        return [nf numberFromString:value];
    }
    return nil;
}

- (double)doubleForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value doubleValue];
    }
    return 0;
}

- (float)floatForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    }
    return 0;
}

- (int)intForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value intValue];
    }
    return 0;
}

- (unsigned int)unsignedIntForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntValue];
    }
    return 0;
}

- (NSInteger)integerForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

- (NSUInteger)unsignedIntegerForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (long long)longLongForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)unsignedLongLongForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

- (BOOL)boolForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    return NO;
}




- (void)turnToClassName:(NSString *)className
{
    NSString *stringH,*stringM;
    stringH = [NSString stringWithFormat:@"#import <Foundation/Foundation.h>\n\n"
               "%@",[self interfaceCodesForName:className]];
    
    stringM = [NSString stringWithFormat:@"#import \"%@.h\"\n\n%@",className,[self implementCodesForName:className]];
    
    [stringH writeToFile:[NSString stringWithFormat:@"/Users/yuanbo/Desktop/%@.h",className] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    [stringM writeToFile:[NSString stringWithFormat:@"/Users/yuanbo/Desktop/%@.m",className] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}
- (NSString *)interfaceCodesForName:(NSString *)className
{
    if (![self count]) {
        return @"";
    }
    NSString *s = @"";
    
    NSString *members = @"";
    NSString *properties = @"";
    
    for (NSString *key in self.allKeys) {
        id value = [self objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            members = [members stringByAppendingFormat:@"   NSString *_%@;\n",key];
            properties = [properties stringByAppendingFormat:@"@property (nonatomic,copy) NSString *%@;\n",key];
        }
        else if([value isKindOfClass:[NSNumber class]])
        {
            members = [members stringByAppendingFormat:@"   NSNumber *_%@;\n",key];
            properties = [properties stringByAppendingFormat:@"@property (nonatomic,retain) NSNumber *%@;\n",key];
        }
        else if([value isKindOfClass:[NSArray class]])
        {
            members = [members stringByAppendingFormat:@"   NSMutableArray *_%@;\n",key];
            properties = [properties stringByAppendingFormat:@"@property (nonatomic,retain) NSMutableArray *%@;\n",key];
            NSArray *arr = (NSArray *)value;
            if ([arr count]) {
                id subValue = [arr objectAtIndex:0];
                if ([subValue isKindOfClass:[NSDictionary class]]) {
                    NSString *name = [self classNameFormKey:key];
                    s = [NSString stringWithFormat:@"%@\n%@",[(NSDictionary *)subValue interfaceCodesForName:name],s];
                }
                
            }
            
        }
        else if([value isKindOfClass:[NSDictionary class]])
        {
            NSString *name = [self classNameFormKey:key];
            members = [members stringByAppendingFormat:@"   %@ *_%@;\n",name,key];
            properties = [properties stringByAppendingFormat:@"@property (nonatomic,retain) %@ *%@;\n",name,key];
            s = [NSString stringWithFormat:@"%@\n%@",[(NSDictionary *)value interfaceCodesForName:name],s];
        }
        else
        {
            NSAssert(0, @"turn error  unknown types");
        }
    }
    properties = [properties stringByAppendingFormat:@"\n + (%@ *)infoFromDic:(NSDictionary *)dic;\n",className];
    s = [s stringByAppendingFormat:
         @"@interface %@ : NSObject\n"
         "{\n"
         "%@"
         "}\n"
         "%@\n"
         "@end\n",className,members,properties];
    
    return s;
}

- (NSString *)classNameFormKey:(NSString *)key
{
    return [[key capitalizedString] stringByAppendingString:@"Info"];
}
- (NSString *)implementCodesForName:(NSString *)className
{
    if (![self count]) {
        return @"";
    }
    NSString *s = @"";
    //    return s;
    NSString *members = @"";
    NSString *properties = @"";
    
    for (NSString *key in self.allKeys) {
        id value = [self objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            members = [members stringByAppendingFormat:@"    info.%@ = [dic objectForKey:@\"%@\"];\n",key,key];
            properties = [properties stringByAppendingFormat:@"    [_%@ release];\n",key];
        }
        else if([value isKindOfClass:[NSNumber class]])
        {
            members = [members stringByAppendingFormat:@"    info.%@ = [dic objectForKey:@\"%@\"];\n",key,key];
            properties = [properties stringByAppendingFormat:@"    [_%@ release];\n",key];
        }
        else if([value isKindOfClass:[NSArray class]])
        {
            
            NSArray *arr = (NSArray *)value;
            //判断是否需要转化为新类，对照生成interface的代码
            if ([arr count] && [[arr objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
                NSDictionary *subValue = [arr objectAtIndex:0];
                NSString *name = [self classNameFormKey:key];
                NSString *arrName = [NSString stringWithFormat:@"%@Arr",key];
                members = [members stringByAppendingFormat:@"    info.%@ = [NSMutableArray array];\n"
                           "    NSArray *%@ = [dic objectForKey:@\"%@\"];\n"
                           "    for(NSDictionary *subDic in %@)\n"
                           "    {\n"
                           "        [info.%@ addObject:[%@ infoFromDic:subDic]];\n"
                           "    }\n"
                           "",key,arrName,key,arrName,key,name];
                s = [s stringByAppendingFormat:@"%@\n",[(NSDictionary *)subValue implementCodesForName:name]];
            }
            else
            {
                members = [members stringByAppendingFormat:@"    info.%@ = [dic objectForKey:@\"%@\"];\n",key,key];
            }
            properties = [properties stringByAppendingFormat:@"    [_%@ release];\n",key];
        }
        else if([value isKindOfClass:[NSDictionary class]])
        {
            NSString *name = [self classNameFormKey:key];
            members = [members stringByAppendingFormat:@"    info.%@ = [%@ infoFromDic:[dic objectForKey:@\"%@\"]];\n",key,name,key];
            s = [NSString stringWithFormat:@"%@\n%@",[(NSDictionary *)value implementCodesForName:name],s];
            properties = [properties stringByAppendingFormat:@"    [_%@ release];\n",key];
        }
        else
        {
            NSAssert(0, @"turn error  unknown types");
        }
    }
    s = [s stringByAppendingFormat:
         @"@implementation %@ : NSObject\n\n"
         "+(%@ *)infoFromDic:(NSDictionary *)dic\n"
         "{\n"
         "    %@ *info = [[[%@ alloc] init] autorelease];\n"
         "%@"//members
         "    return info;\n"
         "}\n\n"
         "- (void)dealloc\n{\n%@"
         "    [super dealloc];\n}\n"
         "@end\n",className,className,className,className,members,properties];
    
    return s;
    
    
}



@end




@implementation NSMutableDictionary (YLAdditions)

- (void)setValueReal:(id)value forKey:(NSString *)key
{
    if (value) {
        
        [self setValue:value forKey:key];
    }
}


@end




