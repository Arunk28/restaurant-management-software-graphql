const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('customers', {
    customerid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(455),
      allowNull: false
    },
    location: {
      type: DataTypes.STRING(1005),
      allowNull: true
    },
    invoiceid: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'invoice',
        key: 'invoiceid'
      }
    }
  }, {
    sequelize,
    tableName: 'customers',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "customerid" },
        ]
      },
      {
        name: "customerid_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "customerid" },
        ]
      },
      {
        name: "fk_invoice_idx",
        using: "BTREE",
        fields: [
          { name: "invoiceid" },
        ]
      },
    ]
  });
};
