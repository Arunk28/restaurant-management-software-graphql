const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('table_reservation', {
    reserveid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    tablenumber: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    customerid: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'table_reservation',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "reserveid" },
        ]
      },
      {
        name: "reserveid_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "reserveid" },
        ]
      },
    ]
  });
};
