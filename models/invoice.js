const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('invoice', {
    invoiceid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    totalamount: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    saledate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'invoice',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "invoiceid" },
        ]
      },
      {
        name: "invoiceid_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "invoiceid" },
        ]
      },
    ]
  });
};
