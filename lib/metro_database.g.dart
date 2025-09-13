// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metro_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $MetroDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $MetroDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $MetroDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<MetroDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorMetroDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $MetroDatabaseBuilderContract databaseBuilder(String name) =>
      _$MetroDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $MetroDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$MetroDatabaseBuilder(null);
}

class _$MetroDatabaseBuilder implements $MetroDatabaseBuilderContract {
  _$MetroDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $MetroDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $MetroDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<MetroDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MetroDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MetroDatabase extends MetroDatabase {
  _$MetroDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StationDao? _stationDaoInstance;

  LineDao? _lineDaoInstance;

  LineStationDao? _lineStationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `lines` (`lineId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stations` (`stationId` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `latitude` REAL NOT NULL, `longitude` REAL NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `line_stations` (`lineId` INTEGER NOT NULL, `stationId` INTEGER NOT NULL, `position` INTEGER NOT NULL, FOREIGN KEY (`lineId`) REFERENCES `lines` (`lineId`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`stationId`) REFERENCES `stations` (`stationId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`lineId`, `stationId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StationDao get stationDao {
    return _stationDaoInstance ??= _$StationDao(database, changeListener);
  }

  @override
  LineDao get lineDao {
    return _lineDaoInstance ??= _$LineDao(database, changeListener);
  }

  @override
  LineStationDao get lineStationDao {
    return _lineStationDaoInstance ??=
        _$LineStationDao(database, changeListener);
  }
}

class _$StationDao extends StationDao {
  _$StationDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$LineDao extends LineDao {
  _$LineDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}

class _$LineStationDao extends LineStationDao {
  _$LineStationDao(
    this.database,
    this.changeListener,
  );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;
}
