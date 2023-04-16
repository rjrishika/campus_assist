import 'package:untitled1/screen/sheetsColumn.dart';
import 'package:gsheets/gsheets.dart';
class SheetsFlutter{
  static String _sheetId = '1hLZoOCEkadRIJZhWDLIrRebkKAK_yKFyi4sMYDpj1hM';
  static const _sheetCredentials = r'''
  {
  "type": "service_account",
  "project_id": "fluttersheets-383708",
  "private_key_id": "d7095280b2a9597f5a5f3d75189bd45a47586ffc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCXYGBl2S5/ijUa\nZd+I+gLDMxBYEqRk6FRvXpMqQXNsvFkBgDM6iAdydrmMpLVl5QUGtEMM5BhWdq8r\nYUe67jImX2+rSyiKgYPHEm+c+2AlZWPs+xDD+jLhTPST6/Qzb7jPJc4WvUUScA5r\nKCk3vnPVvj/2j+26C5ygIBms78uoW7d3oHcV2tqHEM5yHqzZF0rdd06JDfrcAv/N\n809b3cfG7r6k+xH5TXmzBDgL1jcKZtQLGBMMlHs8/WxdrWxqydf7tuSF8gLkN7rN\nWe6cVNjFaKLpC482JXGrMVw28zk3ie5KUzOVob48hu5fXCq2o86BD5YE0qc8kdIw\nNtTSR8BTAgMBAAECggEACS3Y6pQe07EHw1AGHAI9BKUmCpEm0s+bvx0XA2rwmtlY\n9FRXxubUvMYiPjsGnOUkRuHLZw61wxhzSsgdV2J2PAlxdguaq7tqyDl/9x7vF5Vs\nV8RpodicGTlXY1jdd/kAVd9O/eYAODv/Q9Qtm6m60G0257aWjb+Cgdswc2IfEVhW\nhM/DpoLhfTCARCEaZlmxn4rkzvjxdgQbMnH40OIvpgEF5uVi4YRb88t9SC/Eghlz\nipQ0rAvrkYfRpqpIIIVvqHCpsJhqSqeqQ4DxdEQjohSm5QLfPn1SyRkamyolkfTy\nA7M85txeEyZ9MlPId5im/7An5QXzZMJNL/FGlHo0YQKBgQDNFTDYpR0/PEZ+zrGq\nPcwVLehQR2TDvwHh11mmyGiSdqqTR+bwQTsTFt34J3xchicyuKwYtpxcbXW2a1jd\n8xqPoh6eazkUGT6DDRpSiJFwt9HrP1yHdo3loMR/Ynaa4Q2MmRACwV0p6axl54Xx\npplbkiYR20G1ERGYBGgwAo+TGwKBgQC89a3RUD1I1OeXni8iVfkkV4d/fTMsGa62\nNq+bxBgGRo9qoMOfZ/vjcYpJcmQdpkOls1LnH27N76ZtQEgCHJ/wfaYNE8Im5aVJ\nEZiTHAj8M7TNdUMMTIDrGHnD8nUZPfk6GQZXN2QVlCNNy2Ointlz0Cyq3dHaawmS\nR7wvts2jKQKBgQCtFThfb6LqbqWUej+JzZQDP/Z0YnzRk9Az2btpPnS7P/mgSavH\nk1YXO1JlEHYt5G8KqL9eMChw/VS+e4TJ9VWyaYHr89R9ePzAP/u6MlaFSi6Zm6Ut\nEsqZRYDxfZlaB5yWz8uqd6V4LSX571elZhTCKuuEYIbpGRm/MeD4vACOhwKBgBfN\nHmLSJ5YH80/+xdMeXy57s/6UB6ETbxVWmBIXxirsMl5s95cZovnIMHIF7aRqb/Ts\nPJIOPIfGGwGB6lARyPei7AqTpY3+uS4WAFDvZBZYcPq8PYDMFiUGxTewT52pV75A\nrrLHsFyjdzryVo+CUMOswiOXozpO5zq8vHCKJybZAoGAYjfhzxKlMMSlFOlV04sv\n2g6CTGr0kkO3Pexvd3ey6OcI75jZbIrCUmb/ObMzOQYkTefMexPX1ORfGqk3iSYB\n/bi8ojoH2A+A+Ucf5C+ecpweXSZQGBP9sIAFcctfk5dX66OAq8T/xQXGqeVXVIOJ\nWgx0MBDu80iox+CPxypAzvs=\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttersheets@fluttersheets-383708.iam.gserviceaccount.com",
  "client_id": "103194612907607456511",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttersheets%40fluttersheets-383708.iam.gserviceaccount.com"
}
''';
  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_sheetCredentials);

  static Future init()  async{
    try {
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);
      
      _userSheet = await _getWorkSheet(spreadsheet, title: SheetsColumn.subject );

      final firstRow = SheetsColumn.getCloumns();
      _userSheet!.values.insertRow(1, firstRow);
    }catch(e){
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
      required String title,
})async{
    try{
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return spreadsheet.worksheetByTitle(title)! ;
    }
  }
  static Future insert(List<Map<String, dynamic>> rowList) async{
    _userSheet!.values.map.appendRows(rowList);
  }
}