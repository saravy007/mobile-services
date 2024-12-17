
class Language {
  String get appName => "Khmer App";

  String get logoTitle => "Department of Examination Affairs";
  String get home => "Home";
  String get changeToKhmer => "ប្តូរទៅភាសាខ្មែរ";
  String get changeToEnglish => "Change To English";
  String get theme => "Theme";
  String get language => "Language";
  String get changeToLight => "Change To Light Mode";
  String get changeToDark => "Change To Dark Mode";
  String get changeToSystem => "Change To System Mode";
  String get success => "Success";
  String get login => "Login";
  String get userLogin => " Email or Phone number";
  String get password => "Password";
  String get confirmPassword => "Confirm Password";
  String get usernameValid => "Please Input Username";
  String get passwordValid => "Please Input Password";
  String get confirmPassValid => "Please input Confirm Password";
  String get passwordForget => "Forget Password ?";
  String get createAccount => "Create Account";
  String get remeberMe => "Remember Me?";
  String get editProfile => "Edit Profile";
  String get changePassword => "Change Password";
  String get logout => "Logout";
  String get username => "User Name";
  String get phone => "Phone";
  String get phoneValid => "Please Input Phone Number";
  String get role => "Role";
  String get email => "Please Input E-Mail";
  String get status => "Status";
// Application=========================================================================
  String get name => "First Name & Last Name";
  String get firstname => "First Name";
  String get surname => "Surname";
  String get inputValid=>"Please Input ";
  String get textValid => "You can input only letter!";
  String get numberValid => "You can input only number!";



String get province => "Provnce";
String get district => "District";
String get commune => "Commune";
String get village => "Village";

  String get gender => "Gender";
   String get male => "Male";
   String get female => "Female";
   String get genderChoose => "Choose Gender";
  String get dob => "Date Of Birth";
  String get address => "Address";
  String get examDate => "Exam Date";
  String get examCenter => "Exam Center";
  String get room => "Room Number";
  String get seat => "Seat Number";
  String get grade => "Grade";
  String get leader_action => "Leader Activities";
  // =============================== Service Take=========================================

  String get certType => "Cerificate Type";
  String get verifyAttach1 => "Verify";
  String get verifyAttach2 => "Verify";
  String get isName => "Is Name";
  String get oldName => "Old Name";
  String get newName => "New Name";
  String get isGender => "Is Gender";
  String get oldGender => "Old Gender";
  String get newGender => "New Gender";
  String get isDob => "isDob";
  String get oldDob => "Old DOB";
  String get newDob => "New DOB";
  String get oldPob => "Old Place Of Birth";
  String get newPob => "new Place Of Birth";
  String get pob => "Place of birth";
  String get oldFather => "Old Father";
  String get newFather => "New Father";
  String get oldMother => "Old Mother";
  String get newMother => "new Mother";
   String get verifyAttach => "Verify";
  String get editAttach => "Edit";
  String get editAttach2 => "Edit";
  String get reissueAttach1 => "Reissue";
  String get reissueAttach2 => "Reissue";
  String get myAccount => "My Account";
  String get application => "Apply Form";
  String get doccument => "Doccument ";

  String get accountInfo => "Account Information";

  String get grade12 =>"Diploma 12";
  String get grade12_temp =>"Tempory Certificate";
  String get grade12_complete=>"Graduated 12";

  String get edit => "Edit";
  String get reissue => "Reissue";
  String get register => "Register";
  String get passwordMacthMsg => "Password is not match!";
  String get serviceType => "Menu";
  String get qrCode => "QR";
  String get loginError =>"";

  String get applicationInfo => "Aplicant Info";
  String get serviceInfo   => "Service Info";

  String get changeName=>"Change Name";
  String get changeGender=>"Change Gender";
  String get changeDob=>"Change Date Of Birth";
  String get changeMother=>"Change Mother Name";
  String get changeFather=>"Change Father Name";
  String get changeDateExam=>"Change Date Exam";
  String get changeRoom=>"Change Room number";
  String get changeSeat=>"Change Seath number";
  String get changeExamCenter=>"Change Exam Center";
  String get changePob=>"Change Place of Birth";
  String get personalInfo => "Personal Information";
  String get request => "Request";
  String get next =>"Next";
 String get back =>"Back";
 String get choose => "Select ";
 String get saveButton => "Save ";
 String get deleteButton => "Delete ";
  String get ediButton => "Edit ";
 String get viewButton => "View ";
 String get examinfo => "Exam Information";
}

class Khmer implements Language {
  @override
  // TODO: implement appName
  String get appName => "ភាសាខ្មែរ";
  String get next =>"បន្ទាប់";
   String get back =>"ថយក្រោយ";
    String get saveButton => "រក្សាទុក ";
 String get deleteButton => "លុប ";
  String get ediButton => "កែប្រែ ";
 String get viewButton => "មើល ";
  String get examinfo => "ព័ត៌មានប្រឡង";
 

  @override
  String get logoTitle => "នាយកដ្ឋានកិច្ចការប្រឡង";
  @override
  // TODO: implement changeToDark
  String get changeToDark => throw UnimplementedError();

  @override
  String get changeToKhmer => "ប្តូរទៅភាសាខ្មែរ";
  @override
  String get changeToEnglish => "Change To English";

  @override
  // TODO: implement changeToLight
  String get changeToLight => throw UnimplementedError();

  @override
  // TODO: implement changeToSystem
  String get changeToSystem => throw UnimplementedError();

  @override
  // TODO: implement home
  String get home => "ទំព័រដើម";
  @override
  String get leader_action => "សកម្មភាពថ្នាក់ដឹកនាំ";
  @override
  // TODO: implement language
  String get language => "ភាសាខ្មែរ";

  @override
  // TODO: implement success
  String get success => "ជោគជ័យ";
  @override
  String get login => "ចូលប្រើ";
  @override
  // TODO: implement theme
  String get theme => throw UnimplementedError();
  @override
  String get userLogin => "អ៊ីម៉ែល ឬលេខទូរស័ព្ទ";
  String get pob => "ទីកន្លែងកំណើត";
  @override
  String get password => "លេខសម្ងាត់​";
  
  String get accountInfo => "ព័ត៌មានគណនី";
  @override
  String get confirmPassword => "បញ្ជាក់លេខសម្ងាត់​";
  @override
  String get usernameValid => "សូមបញ្ចូល ឈ្មោះអ្នកប្រើប្រាស់!";
  String get textValid => "លោកអ្នកមិនអាចបញ្ចូលលេខបានទេ!";
  String get numberValid => "លោកអ្នកមិនអាចបញ្ចូលអក្សរបានទេ!";
  @override
  String get passwordValid => "សូមបញ្ចូលលេខសម្ងាត់!";
  @override
  String get confirmPassValid => "សូមបញ្ចូលលេខសម្ងាត់បញ្ជាក់ម្ដងទៀត!";
  @override
  String get createAccount => "បង្កើតគណនី";
   @override
  String get email => "សូមបញ្ចូល អ៊ីម៉ែល";
  String get doccument => "ឯកសារភ្ជាប់ ";
  @override
  String get passwordForget => "ភ្លេចលេខសម្ងាត់ ?";
  String get inputValid=>"សូមបញ្ចូល ";
  String get province => "ខេត្ត";
String get district => "ស្រុក";
String get commune => "ឃុំ";
String get village => "ភូមិ";
String get choose => "ជ្រើសរើស";
  @override
  String get remeberMe => "ចងចាំខ្ញុំ?";
  @override
  String get username => "ឈ្មោះអ្នកប្រើប្រាស់";
  @override
  String get editProfile => "ប្ដូរប្រវត្តិរូប";
  @override
  String get logout => "ចាកចេញ";
  @override
  String get changePassword => "ប្តូរលេខសម្ងាត់";
  @override
  String get phone => "លេខទូរស័ព្ទ";
  @override
  String get role => "តួនាទី";
  @override
  String get status => "ស្ថានភាព";

  // Application=========================================================================
  @override
  String get firstname => "នាមខ្លួន";
  String get surname => "នាមត្រកូល";
  String get male => "ប្រុស";
   String get female => "ស្រី";
  String get name => "គោត្តនាម និងនាមខ្លួន";
  @override
  String get gender => "ភេទ";
  String get genderChoose => "ជ្រើសរើសភេទ";
  @override
  String get dob => "ថ្ងៃខែឆ្នាំកំណើត";
  @override
  String get address => "អាសយដ្ឋាន";
  @override
  String get examDate => "សម័យប្រឡង";
  @override
  String get examCenter => "មណ្ឌលប្រឡង";
  @override
  String get room => "លេខបន្ទប់";
  @override
  String get seat => "លេខតុ";
  @override
  String get grade => "និទ្ទេស";
  String get grade12 =>"សញ្ញាបត្រទុតិយភូមិ";
  String get grade12_temp =>"វិញ្ញបនបត្របណ្ដោះអាសន្ន";
  String get grade12_complete=>"វិញ្ញបនបត្របញ្ចប់ការសិក្សាថ្នាក់ទី១២";


  // =============================== Service Take=========================================

  @override
  String get certType => "ប្រភេទសេវា";
  @override
  String get verifyAttach => "បញ្ជាក់ភាពត្រឹមត្រូវ";
  @override
  String get verifyAttach1 => "បញ្ជាក់ភាពត្រឹមត្រូវ";
  @override
  String get verifyAttach2 => "បញ្ជាក់ភាពត្រឹមត្រូវ";
  @override
  String get isName => "Is Name";
  @override
  String get oldName => "ឈ្មោះ ដែលខុស";
  @override
  String get newName => "ឈ្មោះកែតម្រូវ";
  @override
  String get isGender => "Is Gender";
  @override
  String get oldGender => "ភេទ ដែលខុស";
  @override
  String get newGender => "ភេទថ្មី";
  @override
  String get isDob => "isDob";
  @override
  String get oldDob => "ថ្ងៃខែឆ្នាំកំណើត ដែលខុស";
  @override
  String get newDob => "ថ្ងៃខែឆ្នាំកំណើតថ្មី";
  @override
  String get oldPob => "ទីកន្លែងកំណើត ដែលខុស";
  @override
  String get newPob => "ទីកន្លែងកំណើតថ្មី";
  @override
  String get oldFather => "ឈ្មោះឪពុក ដែលខុស";
  @override
  String get newFather => "ឈ្មោះឪពុកថ្មី";
  @override
  String get oldMother => "ឈ្មោះម្ដាយ ដែលខុស";
  @override
  String get newMother => "ឈ្មោះម្ដាយថ្មី";
  @override
  String get editAttach1 => "កែតម្រូវ";
  @override
  String get edit => "កែតម្រូវ";
  @override
  String get reissue => "ទុតិយតា";
  @override
  String get editAttach => "កែតម្រូវសញ្ញាបត្រ";
  @override
  String get editAttach2 => "កែតម្រូវ";
  @override
  String get reissueAttach1 => "ទុតិយតា";
  @override
  String get reissueAttach2 => "ទុតិយតា";
  @override
  String get phoneValid => "សូមបញ្ចូលលេខទូរស័ព្ទ!";
  @override
  String get register => "ចុះឈ្មោះ";
  @override
  String get request => "ដាក់ពាក្យស្នើសុំកែ";
  @override
  String get passwordMacthMsg => "លេខសម្ងាត់មិនត្រូវគ្នាទេ";
  @override
  String get myAccount => "ឈ្មោះគណនីខ្ញុំ";
  @override
  String get application => "ដាក់ពាក្យ";
  @override
  String get serviceType => "បញ្ជីសេវា";
  String get applicationInfo => "ព័ត៌មានអ្នកស្នើសុំ";
  String get serviceInfo     => "ព័ត៌មានសេវា";
  @override
  String get qrCode => "ស្កេន";
  @override
  String get loginError =>"";
   @override
  String get changeName=>"ស្នើសុំកែឈ្មោះ";
  @override
  String get changeGender=>"ស្នើសុំកែភេទ";
  @override
  String get changeDob=>"ស្នើសុំកែថ្ងៃខែឆ្នាំកំណើត";
  @override
  String get changeMother=>"ស្នើសុំកែឈ្មោះម្ដាយ";
  @override
  String get changeFather=>"ស្នើសុំកែឈ្មោះឪពុក";
  @override
  String get changeDateExam=>"ស្នើសុំកែសម័យប្រឡង";
  @override
  String get changeRoom=>"ស្នើសុំកែបន្ទប់ប្រឡង";
  @override
  String get changeSeat=>"ស្នើសុំកែលេខតុ";
  @override
  String get changeExamCenter=>"ស្នើសុំកែមណ្ឌលប្រឡង";
  @override
  String get changePob => "ស្នើសុំកែទីកន្លែងកំណើត";
  @override
  String get personalInfo => "ព័ត៌មានផ្ទាល់ខ្លួន";

}
