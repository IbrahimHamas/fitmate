abstract final class AppStrings {
  static const String fullNameField = 'Full name';
  static const String enterYourFullName = 'Enter your full name';
  static const String fullNameMustBeAtMost80Characters =
      'Full name must be at most 80 characters';
  static const String thisField = 'This field';
  static const String email = 'Email';
  static const String enterAValidEmailAddress = 'Enter a valid email address';
  static const String username = 'Username';
  static const String usernameMustBeAtLeast3Characters =
      'Username must be at least 3 characters';
  static const String phoneNumber = 'Phone number';
  static const String enterAValidPhoneNumber = 'Enter a valid phone number';
  static const String password = 'Password';
  static const String passwordMustBeAtLeast8Characters =
      'Password must be at least 8 characters';
  static const String passwordMustContainAtLeastOneUppercaseLetter =
      'Password must contain at least one uppercase letter';
  static const String passwordMustContainAtLeastOneLowercaseLetter =
      'Password must contain at least one lowercase letter';
  static const String passwordMustContainAtLeastOneNumber =
      'Password must contain at least one number';
  static const String passwordMustContainAtLeastOneSpecialCharacter =
      'Password must contain at least one special character';
  static const String confirmPassword = 'Confirm password';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String theSignInDetailsAreIncorrect =
      'The sign-in details are incorrect.';
  static const String pleaseConfirmYourEmailBeforeSigningIn =
      'Please confirm your email before signing in.';
  static const String pleaseConfirmYourPhoneNumberBeforeSigningIn =
      'Please confirm your phone number before signing in.';
  static const String anAccountWithThisEmailAlreadyExists =
      'An account with this email already exists.';
  static const String anAccountWithTheseDetailsAlreadyExists =
      'An account with these details already exists.';
  static const String pleaseChooseAStrongerPassword =
      'Please choose a stronger password.';
  static const String pleaseChooseAPasswordDifferentFromYourCurrentOne =
      'Please choose a password different from your current one.';
  static const String theVerificationLinkOrCodeHasExpiredRequestANewOne =
      'The verification link or code has expired. Request a new one.';
  static const String pleaseSignInAgainToContinue =
      'Please sign in again to continue.';
  static const String yourSessionHasExpiredPleaseSignInAgain =
      'Your session has expired. Please sign in again.';
  static const String tooManyAttemptsPleaseTryAgainLater =
      'Too many attempts. Please try again later.';
  static const String tooManyEmailsRequestedPleaseTryAgainLater =
      'Too many emails requested. Please try again later.';
  static const String tooManyVerificationMessagesRequestedPleaseTryAgainLater =
      'Too many verification messages requested. Please try again later.';
  static const String theRequestTimedOutPleaseTryAgain =
      'The request timed out. Please try again.';
  static const String thisRecordAlreadyExists = 'This record already exists.';
  static const String thisActionCouldNotBeCompletedBecauseOfRelatedRecords =
      'This action could not be completed because of related records.';
  static const String someRequiredInformationIsMissing =
      'Some required information is missing.';
  static const String someProvidedInformationIsInvalid =
      'Some provided information is invalid.';
  static const String someProvidedInformationHasAnInvalidFormat =
      'Some provided information has an invalid format.';
  static const String youDoNotHavePermissionToPerformThisAction =
      'You do not have permission to perform this action.';
  static const String theRequestedDataCouldNotBeRetrievedAsExpected =
      'The requested data could not be retrieved as expected.';
  static const String unableToReachTheServicePleaseTryAgain =
      'Unable to reach the service. Please try again.';
  static const String unableToCompleteAuthenticationPleaseTryAgain =
      'Unable to complete authentication. Please try again.';
  static const String unableToLoadOrSaveDataPleaseTryAgain =
      'Unable to load or save data. Please try again.';
  static const String unableToCompleteTheFileOperationPleaseTryAgain =
      'Unable to complete the file operation. Please try again.';
  static const String unableToCompleteTheOperationPleaseTryAgain =
      'Unable to complete the operation. Please try again.';
  static const String theReturnedDataCouldNotBeProcessedPleaseTryAgain =
      'The returned data could not be processed. Please try again.';
  static const String anUnexpectedErrorOccurredPleaseTryAgain =
      'An unexpected error occurred. Please try again.';
  static const String theRequestedItemCouldNotBeFound =
      'The requested item could not be found.';
  static const String thisActionConflictsWithExistingData =
      'This action conflicts with existing data.';
  static const String theSubmittedDataIsTooLarge =
      'The submitted data is too large.';
  static const String tooManyRequestsPleaseTryAgainLater =
      'Too many requests. Please try again later.';
  static const String theServiceIsTemporarilyUnavailablePleaseTryAgainLater =
      'The service is temporarily unavailable. Please try again later.';
  static const String noSessionReturned = 'No session returned.';
  static const String emailAddress = 'Email Address';
  static const String enterYourEmail = 'Enter your email';
  static const String logIn = 'Log In';
  static const String signUp = 'Sign Up';
  static const String fullName = 'Full Name';
  static const String enterYourName = 'Enter your name';
  static const String createAPassword = 'Create a password';
  static const String createAccount = 'Create Account';
  static const String alreadyHaveAnAccount = 'Already have an account?';
  static const String logInLink = 'Log in';
  static const String back = 'Back';
  static const String appNameUppercase = 'IRONPULSE';
  static const String appName = 'IronPulse';
  static const String joinToTheForge = 'Join to the Forge';
  static const String welcomeBack = 'Welcome Back';
  static const String startYourTransformationJourneyToday =
      'Start your transformation journey today.';
  static const String fuelYourProgressLogInToYourPulse =
      'Fuel your progress. Log in to your pulse.';
  static const String pleaseWait = 'Please wait';
  static const String enterYourPassword = 'Enter your password';
  static const String showPassword = 'Show password';
  static const String hidePassword = 'Hide password';
  static const String loggedInSuccessfully = 'Logged in successfully.';
  static const String accountCreatedSuccessfully =
      'Account created successfully';
  static const String loggedOutSuccessfully = 'Logged out successfully.';
  static const String home = 'Home';
  static const String trainers = 'Trainers';
  static const String plans = 'Plans';
  static const String favorites = 'Favorites';
  static const String profile = 'Profile';
  static const String close = 'Close';
  static const String welcomeToIronPulse = 'Welcome to\nIronPulse';
  static const String welcomeDescription =
      'Fuel your progress. Your journey to elite performance starts here.';
  static const String getStarted = 'Get Started';
  static const String dontHaveAnAccount = "Don't have an account?";

  static String requiredField(String field) => '$field is required';

  static String requestFailed(Type errorType) => 'Request failed ($errorType).';

  // Shared interface labels and sample plan content.
  static const String retry = 'Retry';
  static const String searchWorkouts = 'Search workouts...';
  static const String featuredWorkoutPlans = 'Featured Workout Plans';
  static const String seeAll = 'See All';
  static const String searchByNameOrSpecialty = 'Search by name or specialty';
  static const String viewProfile = 'View Profile';
  static const String noTrainersFound = 'No trainers found';
  static const String beginner = 'Beginner';
  static const String advanced = 'Advanced';
  static const String findYourPlan = 'Find Your Plan';
  static const String alphaStrength = 'Alpha Strength';
  static const String samplePlanRating = '4.9';
  static const String eightWeeks = '8 Weeks';
  static const String sixtyMinutesPerDay = '60 Min/Day';
  static const String dayOneUppercase = 'DAY 1';
  static const String dayTwoUppercase = 'DAY 2';
  static const String dayThree = 'Day 3';
  static const String pushDayChestAndTriceps = 'Push Day: Chest & Triceps';
  static const String pullDayBackAndBiceps = 'Pull Day: Back & Biceps';
  static const String barbellBenchPress = 'Barbell Bench Press';
  static const String inclineDumbbellFlys = 'Incline Dumbbell Flys';
  static const String tricepRopePushdowns = 'Tricep Rope Pushdowns';
  static const String latPulldown = 'Lat Pulldown';
  static const String barbellRows = 'Barbell Rows';
  static const String bicepBarbellCurls = 'Bicep Barbell Curls';
  static const String fourSetsTenReps = '4 sets × 10 reps';
  static const String threeSetsTwelveReps = '3 sets × 12 reps';
  static const String fourSetsFifteenReps = '4 sets × 15 reps';
  static const String threeSetsTenReps = '3 sets × 10 reps';
  static const String weekOneFoundations = 'Week 1: Foundations';
  static const String viewAllWeeks = 'View All Weeks';
  static const String activeRecovery = 'Active Recovery';
  static const String startWorkoutUppercase = 'START WORKOUT';
  static const String planDetails = 'Plan Details';
  static const String ironPulseStrengthPhase = 'IronPulse Strength Phase';
  static const String strengthPhaseDescription =
      'A high-intensity program designed for maximum muscle hypertrophy and strengthgains. Focuses on compound movements and progressive overload.';
  static const String duration = 'Duration';
  static const String sixtyToNinetyMinutes = '60-90m';
  static const String frequency = 'Frequency';
  static const String fiveDaysPerWeek = '5 Days/Wk';
  static const String intensity = 'Intensity';
  static const String high = 'High';
  static const String pleaseSignInToViewYourProfile =
      'Please sign in to view your profile.';
  static const String profileTableNotConfigured =
      'Profile Supabase table is not configured yet.';
  static const String editProfile = 'Edit Profile';
  static const String pleaseEnterYourName = 'Please enter your name';
  static const String phoneNumberLabel = 'Phone Number';
  static const String saveChanges = 'Save Changes';
  static const String logOut = 'Log Out';
  static const String confirmLogOut = 'Are you sure you want to log out?';
  static const String cancel = 'Cancel';
  static const String workouts = 'Workouts';
  static const String calories = 'Calories';
  static const String sampleCalories = '1,450';
  static const String timeHours = 'Time (hrs)';
  static const String settings = 'Settings';
  static const String defaultUserName = 'User Name';
  static const String defaultUserEmail = 'user@email.com';

  static String yearsExperience(int years) => '$years yrs exp';

  static String clientsCount(int count) => '$count+ clients';

  static String failedToSave(String error) => 'Failed to save: $error';

  static String noRouteDefined(String? route) => 'No route defined for $route';
}
