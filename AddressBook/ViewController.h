//
//  ViewController.h
//  AddressBook
//
//  Created by Nagam Pawan on 4/5/17.
//  Copyright © 2017 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ViewController : UIViewController<CNContactPickerDelegate>

- (IBAction)contactsButtonTapped:(id)sender;

@end

