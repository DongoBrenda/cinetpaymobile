import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';

class Paiement extends StatefulWidget {
  final montant;

  Paiement(this.montant, );

  @override
  _PaiementState createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {


  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CinetPayCheckout(
      title: 'Guichet de paiement',
      configData: <String, dynamic> {
          'apikey': '26159360261c334bd83b3e5.88924848',
          'site_id': '626885',
          'notify_url': 'https://mondomaine.com/notify/'
      },
      paymentData: <String, dynamic> {
          'transaction_id': DateTime.now().millisecondsSinceEpoch.toString(),
          'amount': widget.montant,
          'currency': 'XAF',
          'channels': 'ALL',
          'description': 'paiement de points pour sip'
      },
      waitResponse: (response) {
         print("reponse du paiement $response");

         print("Statut du paiement ${response['status']}");
         if(response['status'] == 'ACCEPTED'){

         }

          // message(response);
      },
      onError: (error) {
        print("message d'erreur $error");

      }
    );
  }
}

 