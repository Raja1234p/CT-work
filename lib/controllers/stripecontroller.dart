import 'package:get/get.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeController extends GetxController {
   var currentSecret = "sk_test_51Gs90eAunPcLaAkSomlRDuIGhMn3wsMZW9NV9jsA6xiR5ND5Uut62XqHVb9nztqceBYoVERbFh1Vsm6JZfwRZqMk00WQ0ahW8g"
       .obs;
  final CreditCard testCard = CreditCard(
    number: '4111111111111111',
    expMonth: 03,
    expYear: 22,
  );
  Token paymentToken;
  PaymentMethod paymentMethod;
  PaymentIntentResult paymentIntent;
  var error =''.obs;
  Source source;
  var countryname =''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    StripePayment.setOptions(StripeOptions(

        merchantId:
            null,
        publishableKey: "pk_test_51Gs90eAunPcLaAkShzm5X9Svx4PMkfVZdBXPZmbCOaouVJHfmw5gKwNBQM8LWUcRSVcUPw30BT7dk1EXJlMHA2SR00d5iGDksG",
        androidPayMode: 'test'));
  }
  void setError(dynamic error) {
    Get.snackbar('Error', error.toString());

      error = error.toString();
      update();

  }


  void clear(){

    source = null;
    paymentIntent = null;
    paymentMethod = null;
    paymentToken = null;
    update();

  }

  void params(){
    StripePayment.createSourceWithParams(SourceParams(
      type: 'manuallly',
      amount: 2102,

      // currency: 'gbp',
      returnURL: 'example://stripe-redirect',
    )).then((source) {
      Get.snackbar('title', source.sourceId);


        source = source;

    }).catchError(setError);

    update();
  }

  void paymentRequest(){

    StripePayment.paymentRequestWithCardForm(

        CardFormPaymentRequest()).then((paymentMethod) {
      Get.snackbar('', paymentMethod.id);
print(paymentMethod.id);

        paymentMethod = paymentMethod;

    }).catchError(setError);

  }

  void createToken(){

    StripePayment.createTokenWithCard(
      testCard,
    ).then((token) {
      Get.snackbar('', token.tokenId);

        paymentToken = token;

    }).catchError(setError);
  }


  void paymentMethodWithCard(){
    StripePayment.createPaymentMethod(
      PaymentMethodRequest(
        card: testCard,
      ),
    ).then((paymentMethod) {
      Get.snackbar('', paymentMethod.id);


        paymentMethod = paymentMethod;

    }).catchError(setError);
  }


  void createPaymentMethodWithExistingToken(){
    if(paymentToken == null){

      return null;
    }

       else {
      StripePayment.createPaymentMethod(
        PaymentMethodRequest(
          card: CreditCard(
            token: paymentToken.tokenId,
            currency: 'GBP'
          ),
        ),
      ).then((paymentMethod) {
       // print(paymentMethod.id);
        Get.snackbar('', paymentMethod.id);

          paymentMethod = paymentMethod;

      }).catchError(setError);
  }

  update();

  }

  void confirmPaymentIntent(){
    if(paymentMethod == null || currentSecret == null){
      return null;
    }
   else {
      StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: currentSecret.value,
          paymentMethodId: paymentMethod.id,

        ),
      ).then((paymentIntent) {

        Get.snackbar('', paymentIntent.paymentIntentId);

          paymentIntent = paymentIntent;

      }).catchError(setError);
  }

  update();
  }

  void authenticatePaymentIntent(){
    if(currentSecret == null){return null;}

      else {
      StripePayment.authenticatePaymentIntent(clientSecret: currentSecret.value).then((paymentIntent) {

        Get.snackbar('', paymentIntent.paymentIntentId);

          paymentIntent = paymentIntent;

      }).catchError(setError);}

      update();



  }

  void nativePayment(){
    StripePayment.paymentRequestWithNativePay(
      androidPayOptions: AndroidPayPaymentRequest(
        totalPrice: "2.40",
        currencyCode: "EUR",
      ),
      applePayOptions: ApplePayPaymentOptions(
        countryCode: 'DE',
        currencyCode: 'EUR',
        items: [
          ApplePayItem(
            label: 'Test',
            amount: '27',
          )
        ],
      ),
    ).then((token) {

        Get.snackbar('', token.tokenId);
        paymentToken = token;

    }).catchError(setError);

    update();
  }

  void completeNativePayment(){
    StripePayment.completeNativePayRequest().then((_) {
      Get.snackbar('', 'Completed Successfully');
    }).catchError(setError);
  }




}
