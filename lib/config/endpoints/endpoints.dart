class Endpoints {
  static const String baseUrl = 'https://dev.brand-online.kz/api/';

  /// Auth
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';
  static const String refresh = 'auth/refresh';
  static const String registerWithOtp = 'auth/register-with-otp';
  static const String requestOtp = 'auth/request-otp';

  /// Exams – context blocks
  static const String contextBlocks = 'exams/admin/context-blocks';
  static String contextBlockDetail(int id) =>
      'exams/admin/context-blocks/$id';

  /// Exams – pairs
  static const String pairs = 'exams/admin/pairs';
  static String pairDetail(int id) => 'exams/admin/pairs/$id';

  /// Exams – questions
  static const String questions = 'exams/admin/questions';

  /// Schools 
  static const String schools = 'schools';

  //get pairs
  static const String getPairs = 'exams/ent/options';
  static const String getPairsNkt = 'exams/nkt/options';
  
  //start exam
  static const String startExam = 'exams/ent/attempts';
  static const String startExamNkt = 'exams/nkt/attempts';

  //send answers
  static String sendAnswers(int attemptId) => 'exams/attempts/${attemptId}/answers';

  // finish exam
  static String finishExamRequest(int attemptId) => 'exams/attempts/$attemptId/finish-request';
  static String finishExamConfirm(int attemptId) => 'exams/attempts/$attemptId/finish-confirm';

  // history
  static const String history = 'exams/history';
  static String historyResults(int attemptId) => 'exams/attempts/$attemptId/results';

  // continue exam
  static String continueExam(int attemptId) => 'exams/attempts/${attemptId}';

  // exam solution 
  static String examSolution(int attemptId, int attemptQuestionId) => 'exams/attempts/$attemptId/questions/$attemptQuestionId/solution';

  // health
  static const String health = 'health';

  // reset password
  static const String resetPasswordOtp = 'auth/request-password-reset-otp';
  static const String resetPassword = 'auth/reset-password';
}