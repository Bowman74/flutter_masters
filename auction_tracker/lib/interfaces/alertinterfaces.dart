
abstract class IAlertInterfaces {
  Future showAlert(String title, String message, String buttonText);
  Future<bool> showConfirmation(String title, String message, String positiveButtonText, String negativeButtonText);
  void dispose();
}