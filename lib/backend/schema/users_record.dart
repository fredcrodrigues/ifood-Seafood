import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "type_of_user" field.
  String? _typeOfUser;
  String get typeOfUser => _typeOfUser ?? '';
  bool hasTypeOfUser() => _typeOfUser != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "catgory" field.
  String? _catgory;
  String get catgory => _catgory ?? '';
  bool hasCatgory() => _catgory != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "complement" field.
  String? _complement;
  String get complement => _complement ?? '';
  bool hasComplement() => _complement != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _username = snapshotData['username'] as String?;
    _password = snapshotData['password'] as String?;
    _typeOfUser = snapshotData['type_of_user'] as String?;
    _active = snapshotData['active'] as bool?;
    _name = snapshotData['name'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _state = snapshotData['state'] as String?;
    _city = snapshotData['city'] as String?;
    _cep = snapshotData['cep'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _admin = snapshotData['admin'] as bool?;
    _catgory = snapshotData['catgory'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _number = snapshotData['number'] as String?;
    _adress = snapshotData['adress'] as String?;
    _complement = snapshotData['complement'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  String? username,
  String? password,
  String? typeOfUser,
  bool? active,
  String? name,
  String? lastname,
  String? state,
  String? city,
  String? cep,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  String? catgory,
  String? displayName,
  String? number,
  String? adress,
  String? complement,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'username': username,
      'password': password,
      'type_of_user': typeOfUser,
      'active': active,
      'name': name,
      'lastname': lastname,
      'state': state,
      'city': city,
      'cep': cep,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'admin': admin,
      'catgory': catgory,
      'display_name': displayName,
      'number': number,
      'adress': adress,
      'complement': complement,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.username == e2?.username &&
        e1?.password == e2?.password &&
        e1?.typeOfUser == e2?.typeOfUser &&
        e1?.active == e2?.active &&
        e1?.name == e2?.name &&
        e1?.lastname == e2?.lastname &&
        e1?.state == e2?.state &&
        e1?.city == e2?.city &&
        e1?.cep == e2?.cep &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.admin == e2?.admin &&
        e1?.catgory == e2?.catgory &&
        e1?.displayName == e2?.displayName &&
        e1?.number == e2?.number &&
        e1?.adress == e2?.adress &&
        e1?.complement == e2?.complement;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.username,
        e?.password,
        e?.typeOfUser,
        e?.active,
        e?.name,
        e?.lastname,
        e?.state,
        e?.city,
        e?.cep,
        e?.createdTime,
        e?.phoneNumber,
        e?.admin,
        e?.catgory,
        e?.displayName,
        e?.number,
        e?.adress,
        e?.complement
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
