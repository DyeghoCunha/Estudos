// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dadosCadastrais_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosCadastraisModelAdapter extends TypeAdapter<DadosCadastraisModel> {
  @override
  final int typeId = 0;

  @override
  DadosCadastraisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosCadastraisModel()
      ..nomeFantasia = fields[0] as String?
      ..cnpj = fields[1] as String?
      ..inscricaoEstadual = fields[2] as String?
      ..inscricaoMunicipal = fields[3] as String?
      ..dataAbertura = fields[4] as DateTime?
      ..cep = fields[5] as String?
      ..rua = fields[6] as String?
      ..numero = fields[7] as String?
      ..ramoAtividade = fields[8] as String?
      ..segmentoAtividade = (fields[9] as List).cast<String>()
      ..anexoPrincipal = fields[10] as String?
      ..anexoSecundario = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, DadosCadastraisModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.nomeFantasia)
      ..writeByte(1)
      ..write(obj.cnpj)
      ..writeByte(2)
      ..write(obj.inscricaoEstadual)
      ..writeByte(3)
      ..write(obj.inscricaoMunicipal)
      ..writeByte(4)
      ..write(obj.dataAbertura)
      ..writeByte(5)
      ..write(obj.cep)
      ..writeByte(6)
      ..write(obj.rua)
      ..writeByte(7)
      ..write(obj.numero)
      ..writeByte(8)
      ..write(obj.ramoAtividade)
      ..writeByte(9)
      ..write(obj.segmentoAtividade)
      ..writeByte(10)
      ..write(obj.anexoPrincipal)
      ..writeByte(11)
      ..write(obj.anexoSecundario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosCadastraisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
