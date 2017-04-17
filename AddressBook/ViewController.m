//
//  ViewController.m
//  AddressBook
//
//  Created by Nagam Pawan on 4/5/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"
@import Contacts;
@import ContactsUI;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)contactsButtonTapped:(id)sender {
    
    CNContactStore *store = [[CNContactStore alloc]init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            
            CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc]init];
            contactPicker.delegate = self;
            [self presentViewController:contactPicker animated:YES completion:nil];
        }
    }];
    
    
}

-(void)contactPickerDidCancel:(CNContactPickerViewController *)picker{
    
    NSLog(@"Canceled");
    
}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
    
    NSLog(@"contact selected");
    NSMutableString *name = [[NSMutableString alloc]initWithString:contact.givenName];
    [name appendString:[NSString stringWithFormat:@" %@", contact.familyName]];
    [self getContactDetails:contact];
    
    NSLog(@"name is %@", name);
    
}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{
    
    NSLog(@"Property Selected");
    
}

-(void)getContactDetails:(CNContact *)contact{
    
    NSString *phone = @"";
    for (CNLabeledValue *phoneLabel in contact.phoneNumbers) {
        
        CNPhoneNumber *phnNo = phoneLabel.value;
        phone = [phnNo stringValue];

    }
}

@end
