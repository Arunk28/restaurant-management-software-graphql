const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('employees', {
    empid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(455),
      allowNull: false
    },
    salary: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    joiningdate: {
      type: DataTypes.DATE,
      allowNull: true
    },
    createddate: {
      type: DataTypes.DATE,
      allowNull: true,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    address: {
      type: DataTypes.STRING(1000),
      allowNull: true
    },
    designation: {
      type: DataTypes.STRING(455),
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'employees',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "empid" },
        ]
      },
      {
        name: "idemployees_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "empid" },
        ]
      },
    ]
  });
};
