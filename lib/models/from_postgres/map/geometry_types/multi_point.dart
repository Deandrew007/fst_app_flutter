import 'package:flutter/material.dart';
import 'package:fst_app_flutter/models/from_postgres/map/geometry_types/geometry_object.dart';
import 'package:fst_app_flutter/models/from_postgres/map/geometry_types/geometry_type.dart';
import 'package:fst_app_flutter/models/from_postgres/map/position.dart';

class MultiPoint extends GeometryObject {
  List<Position> _coordinates;

  List<Position> get coordinates => _coordinates;

  MultiPoint({@required coordsJSON})
      : assert(coordsJSON != null),
        super(GeometryType.MultiPoint) {
    _coordinates = List.generate(
        coordsJSON.length,
        (i) => Position(
            newLongitude: coordsJSON[i]['longitude'],
            newLatitude: coordsJSON[i]['latitude']));
  }

  @override
  toGeoJSON() {
    return {
      '\"type\"': '\"${type.toShortString()}\"',
      '\"coordinates\"': coordinates.map((e) => e.toGeoJSON()).toList()
    };
  }
}
