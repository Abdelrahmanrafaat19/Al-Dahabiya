// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductDataAdapter extends TypeAdapter<CartProductData> {
  @override
  final int typeId = 0;

  @override
  CartProductData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductData(
      id: fields[0] as dynamic,
      type: fields[1] as String?,
      status: fields[2] as dynamic,
      isFavourite: fields[3] as bool?,
      name: fields[4] as String?,
      desc: fields[5] as String?,
      productPhoto: fields[6] as String?,
      price: fields[7] as double?,
      currency: fields[8] as String?,
      hasDiscount: fields[9] as bool?,
      discountPrice: fields[10] as dynamic,
      review: fields[11] as dynamic,
      productQuantity: fields[12] as dynamic,
      quality: fields[13] as dynamic,
    )..option = fields[14] as dynamic;
  }

  @override
  void write(BinaryWriter writer, CartProductData obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.isFavourite)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.desc)
      ..writeByte(6)
      ..write(obj.productPhoto)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.currency)
      ..writeByte(9)
      ..write(obj.hasDiscount)
      ..writeByte(10)
      ..write(obj.discountPrice)
      ..writeByte(11)
      ..write(obj.review)
      ..writeByte(12)
      ..write(obj.productQuantity)
      ..writeByte(13)
      ..write(obj.quality)
      ..writeByte(14)
      ..write(obj.option);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
