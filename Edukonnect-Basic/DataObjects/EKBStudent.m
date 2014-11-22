//
//  EKBStudent.m
//  Edukonnect-Basic
//
//  Created by Edupsyche on 11/12/14.
//  Copyright (c) 2014 Kedar Desai. All rights reserved.
//

#import "EKBStudent.h"

@implementation EKBStudent

- (id)init
{
    self = [super init];
    
    if (self) {
        self.studentAadharNo = @"";
        self.studentDiv = @"";
        self.studentDOB = @"";
        self.studentGRNo = @"";
        self.studentId = @"";
        self.studentMobile1 = @"";
        self.studentMobile2 = @"";
        self.studentName = @"";
        self.studentRollNo = @"";
        self.studentSchoolId = @"";
        self.studentStd = @"";
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if ( self != nil )
    {
        //decode the properties
        self.studentAadharNo = [decoder decodeObjectForKey:@"studentAadharNo"];
        self.studentDiv = [decoder decodeObjectForKey:@"studentDiv"];
        self.studentDOB = [decoder decodeObjectForKey:@"studentDOB"];
        self.studentGRNo = [decoder decodeObjectForKey:@"studentGRNo"];
        self.studentId = [decoder decodeObjectForKey:@"studentId"];
        self.studentMobile1 = [decoder decodeObjectForKey:@"studentMobile1"];
        self.studentMobile2 = [decoder decodeObjectForKey:@"studentMobile2"];
        self.studentName = [decoder decodeObjectForKey:@"studentName"];
        self.studentRollNo = [decoder decodeObjectForKey:@"studentRollNo"];
        self.studentSchoolId = [decoder decodeObjectForKey:@"studentSchoolId"];
        self.studentStd = [decoder decodeObjectForKey:@"studentStd"];
    }
    return self;
}

#pragma mark Encoding Object

-(void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode the properties of the object
    [encoder encodeObject:self.studentAadharNo forKey:@"studentAadharNo"];
    [encoder encodeObject:self.studentDiv forKey:@"studentDiv"];
    [encoder encodeObject:self.studentDOB forKey:@"studentDOB"];
    [encoder encodeObject:self.studentGRNo forKey:@"studentGRNo"];
    [encoder encodeObject:self.studentId forKey:@"studentId"];
    [encoder encodeObject:self.studentMobile1 forKey:@"studentMobile1"];
    [encoder encodeObject:self.studentMobile2 forKey:@"studentMobile2"];
    [encoder encodeObject:self.studentName forKey:@"studentName"];
    [encoder encodeObject:self.studentRollNo forKey:@"studentRollNo"];
    [encoder encodeObject:self.studentSchoolId forKey:@"studentSchoolId"];
    [encoder encodeObject:self.studentStd forKey:@"studentStd"];
}

@end
