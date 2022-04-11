const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('pop', {
    popid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    fid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'food',
        key: 'fid'
      }
    },
    invoiceid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'invoice',
        key: 'invoiceid'
      }
    },
    quantity: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'pop',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "popid" },
        ]
      },
      {
        name: "popid_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "popid" },
        ]
      },
      {
        name: "fd_fk_idx",
        using: "BTREE",
        fields: [
          { name: "fid" },
        ]
      },
      {
        name: "inv_fk_idx",
        using: "BTREE",
        fields: [
          { name: "invoiceid" },
        ]
      },
    ]
  });
};
