//
//  MyStrings.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation

class MyStrings {
    
    static let sharedInstance = MyStrings()
    
    lazy var APP_NAME : String  = "magnet"
    
    lazy var DONE : String  = "Done".localized
    lazy var CANCEL : String = "Cancel".localized
    lazy var SELECT : String = "Select".localized
    lazy var INVALID_DATA : String = "Err: Invalid Data".localized
    lazy var ALL : String = "All".localized
    lazy var BACK : String  = "Back".localized
    lazy var HELP : String = "Help".localized
    lazy var HELPER_ALERT_TITLE : String = "Help".localized
    lazy var OTHERS : String = "Others".localized
    lazy var OTHER : String = "Other".localized
    lazy var PIECES_ABBR : String = "Pcs.".localized
    lazy var SEND: String = "Send".localized
    lazy var SENDING : String = "Sending..".localized
    lazy var UPDATE : String = "Update".localized
    lazy var DELETE : String = "Delete".localized
    lazy var WARNING : String = "Warning".localized
    lazy var PREVIEW : String = "Preview".localized
    lazy var PUBLISH : String = "Publish".localized
    lazy var SUCCESS : String = "Success".localized
    lazy var EDIT : String = "Edit".localized
    lazy var SAVE : String = "Save".localized
    lazy var CODE_LABEL : String = "Code:".localized
    lazy var DATASET_EMPTY_ERROR : String = "DATASET_EMPTY_ERROR".localized
    lazy var INVOICE_COUNT_ABBR : String = "INVOICE_COUNT_ABBR".localized
    lazy var EXPORT : String = "Export".localized
    lazy var REMOVE : String = "Remove".localized
    lazy var READING = "Reading..".localized
    lazy var UPDATING = "Updating..".localized
    lazy var DELETING = "Deleting..".localized
    lazy var OPEN : String = "Open".localized
    lazy var AVERAGE_ABBRV_LABEL : String = "Avg:".localized
    lazy var INVALID_PERMISSION_ERROR : String = "Invalid permission. Request denied".localized
    lazy var OPEN_IN_SAFARI : String = "Open in Safari".localized
    lazy var EXCEL : String = "Excel"
    lazy var TAP_TO_CHANGE_SELECTION : String = "Tap to change your selection".localized
    
    lazy var ACCOUNT_ALERT_TITLE : String = "Account Error".localized
    lazy var ACCOUNT_CLOSED : String = "Your account is suspended. Please contact your supervisor/HR and verify your information".localized
    
    lazy var ACTION_CALL_NOTFOUND_EXCEPTION : String = "Dialer app cannot be found".localized
    
    lazy var CURRENT_LOCATION : String = "Your Current Location".localized
    lazy var DEVICE_DEACTIVATED : String = "Your device is deactivated. Please try to login again".localized
    lazy var LOGIN: String = "Login".localized
    lazy var LOGIN_ERROR_DB_ERROR : String = "Invalid account info. Please contact your supervisor/IT".localized
    lazy var NOT_AVAILABLE : String = "Not Available".localized
    lazy var DB_EMPTY_LOGIN_MUST : String = "There is no active account. Please login".localized
    lazy var DB_EMPTY_RESTART_MUST : String = "App dbError:Please close and relaunch the application".localized
    
    
    lazy var SECOND_SHORT_STRING : String = "sec.".localized
    lazy var DAY_SHORT_STRING : String = "d".localized
    lazy var HOUR_SHORT_STRING : String = "h".localized
    lazy var MIN_SHORT_STRING : String = "m".localized
    
    lazy var ABOUT : String = "About".localized
    lazy var ADD : String = "Add".localized
    lazy var ADD_ITEM : String = "Add New Item To Cart".localized
    lazy var ADD_ITEM_FROM_LIST : String = "Add From List".localized
    lazy var ADD_ITEM_MANUALLY : String = "Add Manually".localized
    
    lazy var ADVANCED_COMPANY_STORE_MANAGEMENT : String = "Advanced Store Management".localized
    lazy var ADVANCED_COMPANY_STORE_MANAGEMENT_MODE_HINT : String = "Advanced Store Management allows you to manage and to monitor multiple stores in your single company from different (or same) retail fields.".localized
    
    
    lazy var ACCEPT_ORDER : String = "Accept Order".localized
    
    lazy var ADDRESS_PICK : String = "Create an Address".localized
    lazy var ADDRESS_INFORMATION : String = "Address Information".localized
    lazy var ADDRESS_TYPE : String = "Address Type".localized
    lazy var ADDRESS_TYPE_HOME : String = "Home".localized
    lazy var ADDRESS_TYPE_WORK : String = "Work".localized
    lazy var ADDRESS_TYPE_OTHER : String = "Other".localized
    lazy var ADDRESS_ADD : String = "Add your address".localized
    
    lazy var ADDRESS_CITY_CANNOT_BE_EMPTY : String = "City name cannot be empty".localized
    lazy var ADDRESS_COUNTY_CANNOT_BE_EMPTY : String = "County name cannot be empty".localized
    lazy var ADDRESS_DETAILS_CANNOT_BE_EMPTY : String = "Address details cannot be empty".localized
    
    
    lazy var API_REQUEST_TIMEOUT : String = "Connection timed out, no response from the server".localized
    lazy var API_REQUEST_ERROR : String = "Connection error. Please check your network status".localized
    lazy var API_REQUEST_ERROR_SP : String = "Connection Error. App parameters cannot be retrieved".localized
    lazy var API_REQUEST_ERROR_SYSTEM_MAINTENANCE : String = "System maintenance is on the run. App will be available shortly after".localized
    
    lazy var APP_SETTINGS : String = "Application Settings".localized
    
    lazy var ACCOUNT_SYNCING : String = "Retrieving your account".localized
    lazy var ALL_NEIGHBORHOODS : String = "All Neighborhoods".localized
    
    lazy var AVAILABLE : String = "Available".localized
    
    lazy var BARCODE_READER : String = "Barcode Reader".localized
    
    lazy var CALL : String = "Call".localized
    lazy var CART_MINIMUM_AMOUNT : String = "Minimum Cart Amount".localized
    lazy var CART_MINIMUM_AMOUNT_ABBRV : String = "Min. Amount".localized
    lazy var CITY : String = "City".localized
    
    lazy var COMMENTS : String = "Comments".localized
    
    lazy var COMPANY_REGISTER : String = "Company Register".localized
    lazy var COMPANY : String = "Company".localized
    lazy var COMPANY_INFO : String = "Company Info".localized
    lazy var COMPANY_INFO_SUBTITLE : String = "Legal information, validations and its location of your company".localized
    lazy var COMPANY_NAME : String = "Company Title".localized
    lazy var COMPANY_NAME_PLACEHOLDER : String = "Store Name eg: Monks Cafe".localized
    lazy var COMPANY_NAME_REQUIRED : String = "Company Name is required".localized
    
    lazy var COMPANY_ADDITIONAL_NOTES : String = "Additional Notes".localized
    lazy var COMPANY_ADDITIONAL_NOTES_PLACEHOLDER : String = "You can add here your notes to your customers or any additional information about your business".localized
    lazy var COMPANY_ADDITIONAL_NOTES_ABSENT : String = "Store notes cannot be found".localized
    lazy var COMPANY_COUNTY_EMPTY_ERROR : String = "You should pick your store location before assign service nodes".localized
    
    lazy var CONNECTION_ERROR : String = "Server connection lost please wait while recovering".localized
    
    lazy var COMPLETE_PROFILE : String = "Complete Profile".localized
    
    lazy var CONTACT_US : String = "Contact Us".localized
    
    lazy var COUNTRY : String = "Country".localized
    lazy var COUNTY : String = "County".localized
    lazy var COUNTY_REVERSE_GEOCODE_ERROR : String = "County cannot be assigned automatically. Please select from the list".localized
    lazy var CREATE_SERVICE_ORDER : String = "Request Service Order".localized
    lazy var CUSTOMER : String = "Customer".localized
    
    lazy var DATED : String = "Dated".localized
    
    lazy var DILAVERY_GUYS : String = "Delivery".localized // A tribute to bromozom 27.7.2018
    
    lazy var EDIT_ORDER : String = "Edit Order".localized
    
    lazy var ENLARGE : String = "Enlarge".localized
    
    lazy var EMAIL : String = "Email"
    lazy var EMAIL_CONFIRMED : String = "Email Confirmed".localized
    lazy var EMAIL_NOT_VALID : String = "Invalid email address".localized
    lazy var EMAIL_VALIDATION_HELPER : String = "Please enter the code that we sent to your email".localized
    
    lazy var ENABLE_ADVANCED_MODE : String = "Enable Advanced Mode".localized
    
    lazy var FAVORITES : String = "Favorites".localized
    
    lazy var FIRST_NAME : String = "First Name".localized
    lazy var FIRST_NAME_REQUIRED : String = "First name field is required".localized
    lazy var FIRST_NAME_YOURS : String = "Your First Name".localized
    
    lazy var FORGOT_PASSWORD : String = "Forgot Password".localized
    lazy var PASSWORD_SENT_VIA_SMS : String = "Your password has been sent to you via sms".localized
    
    
    lazy var LAST_NAME : String = "Last Name".localized
    lazy var LAST_NAME_REQUIRED : String = "Last name field is required".localized
    lazy var LAST_NAME_YOURS : String = "Your Last Name".localized
    
    lazy var RETURN_HOME_PAGE : String = "Go Back to Home Screen".localized
    
    lazy var HELP_AND_SUPPORT : String = "Help and Support".localized
    
    lazy var INVALID_VERIFICATION_CODE : String = "Invalid verification code";
    lazy var INVALID_SERVICE_LOCATION_ERROR : String = "Service location must be within administrative area of your store".localized
    
    lazy var IN_STOCK_SWITCH : String = "In Stock".localized
    
    lazy var LEGAL_INFORMATION_TITLE : String = "Legal Information".localized
    lazy var LOCATION_INFORMATION_TITLE : String = "Location Information".localized
    lazy var LOCATION_INFORMATION_REQUIRED : String =  "Location info is required".localized
    lazy var LOGOUT : String = "Logout".localized
    lazy var LOGOUT_PROMPT : String = "You are about to logoff. Are you sure?".localized
    lazy var LONG_DISTANCE : String = "long_distance".localized
    lazy var MESSAGE_STORE : String = "Message".localized
    lazy var MINIMIZE : String = "Minimize".localized
    
    lazy var ME : String = "Me".localized
    lazy var MY_CURRENT_ADDRESS : String = "My Current Address".localized
    lazy var MY_DILAVERY_EMPLOYEES : String = "Delivery Employees (Soon)".localized // A tribute to bromozom 27.7.2018
    lazy var MY_DILAVERY_EMPLOYEES_SUBTITLE : String = "Add registered users to your company".localized
    
    lazy var MY_PREFERENCES : String = "My Preferences".localized
    lazy var MY_NOTIFICATIONS : String = "My Notifications".localized
    lazy var MY_PROFILE : String = "My Profile".localized
    lazy var MY_ORDERS : String = "My Orders".localized
    lazy var MY_ORDERS_HISTORY : String = "My Orders History".localized
    lazy var MY_ADDRESSES : String = "My Addresses".localized
    lazy var MY_DEBIT_CARDS : String = "My Debit Cards".localized
    lazy var MY_PERSONAL_INFORMATIONS : String = "My Personal Informations".localized
    lazy var MY_PAST_ORDERS : String = "My Past Orders".localized
    lazy var MY_FAVORITES : String = "My Favorites".localized
    
    lazy var MAIN_PAGE : String = "Main Page".localized
    lazy var MY_MESSAGES : String = "My Messages".localized
    
    lazy var NEIGHBORHOOD : String = "Neighborhood".localized
    
    lazy var NOTIFICATIONS_SETTINGS : String = "Notification Settings".localized
    
    lazy var OFFLINE_MODE :String = "Offline Mode".localized
    lazy var OFFLINE_MODE_HINT : String = "When you are offline users cannot send new orders by the app. But your store will still be listed and available for phone calls. Please fill out below form to leave the app completely".localized
    lazy var OFFLINE_MODE_PERMANENT_REASON : String = "Please type a your request and your reason (if any) to leave the app. We will review your request and remove your account permanently".localized
    
    lazy var ON_DUTY : String = "On 24h Duty".localized
    
    lazy var ORDER : String = "Order".localized
    lazy var ORDER_DETAILS : String = "Order Details".localized
    lazy var ORDER_SERVICE_PLAN_DATE : String = "Appointment Date".localized
    lazy var ORDER_CART_ADD_SERVICE : String = "Add Service to Order".localized
    lazy var ORDER_CART_ADD_SERVICE_TITLE : String = "Requested Services".localized
    lazy var ORDER_CART_ADD_SERVICE_HINT : String = "Adding service to your appointment is for information only. You may be charged differently at the store".localized
    lazy var ORDER_SERVICE_NOTES : String = "Additional notes".localized
    lazy var ORDER_SERVICE_ADD_SUCCESS_MESSAGE : String = "Your service order request has been sent successfully. Please wait approval message from the service store. You may goto message screen right away to add further details about your order or you can go back to the home page to follow your order".localized;
    
    lazy var ORDER_ACCEPT : String = "Accept Order".localized
    lazy var ORDER_CANCEL : String = "Cancel Order".localized
    lazy var ORDER_COMPLETE : String = "Complete Order".localized
    lazy var ORDER_COMPLETED : String = "Order Dispatched. See you next time :)".localized
    lazy var ORDER_COMPLETED_SHORT : String = "Dispatched".localized
    lazy var ORDER_COMMENT_TITLE : String = "Rate Your Order".localized
    lazy var ORDER_EN_ROUTE : String = "Your order is dispatched. Delivery shortly".localized
    lazy var ORDER_EN_ROUTE_SHORT : String = "En Route".localized
    lazy var ORDER_CANCELLED : String = "Order cancelled".localized
    lazy var ORDER_CANCELLED_SHORT : String = "Cancelled".localized
    lazy var ORDER_CANCEL_PROMPT : String = "You are about to cancel this order. Are you sure?".localized
    lazy var ORDER_ACCEPT_PROMPT : String = "You are about to confirm this order. Are you sure?".localized
    lazy var ORDER_OPEN : String = "Open".localized
    lazy var ORDER_POINT_EMPTY_ERROR : String = "Please rate your order".localized
    lazy var ORDER_YOUR_COMMENTS : String = "Your comments:".localized
    lazy var ORDER_YOUR_COMMENTS_HINT : String = "Your comments will be published after a confirmation process. We reserve the rights to not publish offensive, illegal comments.".localized
    
    lazy var PASSWORD : String = "Password".localized
    lazy var PASSWORD_AGAIN : String = "Password Again".localized
    lazy var PASSWORD_REQUIRED : String = "Password is required".localized
    lazy var PASSWORDS_DO_NOT_MATCH : String = "Passwords do not match. Please check".localized
    
    lazy var PAYMENT_TYPE : String = "Payment Type".localized
    lazy var PAYMENT_TYPE_SELECT_MUST_ERROR = "At least one payment type must be selected to proceed".localized
    
    lazy var PERSONAL_INFORMATION = "Personal Info".localized
    lazy var PERSONAL_INFORMATION_SUBTITLE = "Personal Details of your account. Social media link (Soon)".localized
    
    lazy var PHONE_NUMBER : String = "Phone Number".localized
    lazy var PHONE_NUMBER_CONFIRMED : String = "Phone Number Confirmed".localized
    lazy var PHONE_NUMBER_PLACEHOLDER : String = "Delivery Number".localized
    lazy var PHONE_NUMBER_REQUIRED : String = "Phone number is required".localized
    lazy var PHONE_NUMBER_VALIDATION_HELPER : String = "Please enter the code that we sent to your phone".localized
    
    lazy var PLAN_DATE_CANNOT_BE_NULL : String = "Plan date cannot be null for service orders".localized
    
    
    lazy var POSTAL_ADDRESS_PLACEHOLDER : String = "Address details. You can add your own details, directions or guidance..".localized;
    
    lazy var PRODUCT_INFO : String = "Product Info".localized
    lazy var PRODUCT_NAME : String = "Product Name".localized
    lazy var PRODUCT_SERVICE_NOT_AVAILABLE_ATM : String = "This product/service is not available at the moment".localized
    
    lazy var PROFILE_PHOTO : String = "Profile Photo".localized
    lazy var PRICE : String = "Price".localized
    
    lazy var PRIVACY_SETTINGS : String = "Privacy Settings".localized
    
    lazy var PRIVACY_NOTIFICATIONS_ORDER : String = "Order Notifications".localized
    lazy var PRIVACY_NOTIFICATIONS_VIEWS : String = "Views Notifications".localized
    lazy var PRIVACY_NOTIFICATIONS_PROMOTIONS : String = "Promotion Notifications".localized
    lazy var PRIVACY_HIDE_MY_NAME : String = "Hide My Name".localized
    lazy var PRIVACY_HIDE_MY_ONLINE_STATUS : String = "Hide My Online Status".localized
    
    lazy var REGISTER : String = "Register".localized
    lazy var REJECT_ORDER : String = "Reject Order".localized
    
    lazy var REMOVE_STORE : String = "Remove Store".localized
    lazy var REMOVE_STORE_FROM_APP : String = "Remove Store from the app".localized
    
    lazy var RETAIL_FIELD : String = "Retail Field".localized
    lazy var RETAIL_FIELD_ON_SERVICE : String = "? different retail field on service".localized
    lazy var SAVE_AND_SEND_CODE : String = "Save & Send Code".localized
    
    lazy var SETTINGS : String = "Settings".localized
    lazy var SERVICE_NODES : String = "Service Nodes".localized
    
    lazy var SEND_AGAIN : String = "Send Again".localized
    lazy var SEND_MESSAGE : String = "Send Message".localized
    lazy var SERVICE_HOUR_WEEKDAYS = "Delivery Hours - Weekdays".localized
    lazy var SERVICE_HOUR_SATURDAY = "Delivery Hours - Weekends".localized
    lazy var SERVICE_HOUR_SUNDAY = "Delivery Hours - Sunday & Holidays".localized
    lazy var SERVICE_AVAILABLE_ON_DATE = "Delivery available for giving date".localized
    
    lazy var SHOW_ON_MAP = "Show on map".localized
    lazy var SHOW_ACTIONS = "Show actions".localized
    
    lazy var SMS_SENT = "Your sms with confirmation code is on its way".localized
    
    lazy var SIGN_IN : String = "Sign In".localized
    lazy var SIGN_IN_LABEL : String = "Already have an account?".localized
    
    lazy var SIGN_UP : String = "Sign Up".localized
    lazy var SIGN_UP_LABEL : String = "Don't have an account?".localized
    lazy var SMS_NOT_ARRIVED_NOTE : String =  "SMS not delivered?".localized
    
    lazy var SPECIAL_FOR_YOU : String = "Special for you".localized
    
    lazy var START_DATE_LABEL : String = "Start Date".localized
    lazy var END_DATE_LABEL : String = "End Date".localized
    lazy var START_HOUR_LABEL : String = "Start Hour".localized
    lazy var END_HOUR_LABEL : String = "End Hour".localized
    lazy var PICK_A_DATE : String = "Pick a date".localized
    
    lazy var SELECTED : String = "Selected".localized
    
    lazy var STORE_ACTIVITY_INFO : String = "Store Activity Info".localized
    lazy var STORE_CANNOT_BE_FOUND : String = "Store cannot be null".localized
    lazy var STORE_CONTENT_DETAILS : String = "Store Content Details".localized
    lazy var STORE : String = "Store".localized
    lazy var STORE_CONTENT_DETAILS_SUBTITLE : String = "Retail field, service contents and delivery times of your store".localized
    
    lazy var STORE_CONTENT_SELECT_MUST_ERROR = "At least one store content must be selected to proceed".localized
    lazy var STORE_SERVICE_LOCATION : String = "Store Service Locations".localized
    lazy var STORE_SERVICE_LOCATION_SUBTITLE : String = "Delivery nodes and minimum cart amounts of your store".localized
    
    lazy var STORE_SERVICE_LOCATION_COUNTY_EMPTY : String = "County cannot be empty. Cancelled..".localized
    lazy var STORE_SERVICE_LOCATION_IS_EMPTY : String = "You should select at least one service region".localized
    lazy var STORE_TITLE : String = "Store Title".localized
    
    lazy var SUMMARY : String = "Summary".localized
    
    lazy var TAX_NUMBER : String = "Tax Number".localized
    lazy var TAX_NUMBER_REQUIRED : String = "Tax Number is required".localized
    lazy var TAX_OFFICE : String = "Tax Office".localized
    lazy var TAX_OFFICE_REQUIRED : String = "Tax Office is required".localized
    lazy var TAX_VALIDATION_CODE : String = "Validation Code".localized
    
    lazy var UNKNOWN_USER_OR_PASSWORD : String = "Unknown user or wrong password".localized
    lazy var UPLOAD_FAILED : String = "Upload Failed".localized
    lazy var UNIT : String = "Unit".localized
    lazy var UPDATED : String = "Updated".localized
    
    lazy var WEB_ADDRESS : String = "Web Url".localized
    lazy var WEB_ADDRESS_PLACEHOLDER : String = "http://"
    lazy var WELCOME : String = "Welcome".localized
    lazy var VALIDATE : String = "Validate".localized
    lazy var YES : String = "Yes".localized
    
    lazy var LAST_UPDATE_WITH_COLON : String = "Last Update:".localized
    lazy var SEARCH_REPOSITORIES : String = "Search repos..".localized
    lazy var RECORDS_REMAINING : String = "records remaining..".localized
    
    lazy var PUBLIC_REPOS: String = "public repos".localized
    lazy var FOLLOWERS : String = "followers".localized
    lazy var BIO_NOT_AVAILABLE : String = "bio not available".localized
}
