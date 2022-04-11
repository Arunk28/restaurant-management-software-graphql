const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('administrator', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(455),
      allowNull: false
    },
    password: {
      type: DataTypes.STRING(455),
      allowNull: false
    },
    empid: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'employees',
        key: 'empid'
      }
    }
  }, {
    sequelize,
    tableName: 'administrator',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "id_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "emp_fk_idx",
        using: "BTREE",
        fields: [
          { name: "empid" },
        ]
      },
    ]
  });
};
