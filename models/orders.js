const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('orders', {
    orderid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    customerid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'customers',
        key: 'customerid'
      }
    },
    tableid: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    foodid: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'food',
        key: 'fid'
      }
    },
    orderdate: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    attender: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'employees',
        key: 'empid'
      }
    },
    quantity: {
      type: DataTypes.INTEGER,
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
    tableName: 'orders',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "orderid" },
        ]
      },
      {
        name: "orderid_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "orderid" },
        ]
      },
      {
        name: "fk_id_idx",
        using: "BTREE",
        fields: [
          { name: "foodid" },
        ]
      },
      {
        name: "cus_id_idx",
        using: "BTREE",
        fields: [
          { name: "customerid" },
        ]
      },
      {
        name: "emp_id_idx",
        using: "BTREE",
        fields: [
          { name: "attender" },
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
