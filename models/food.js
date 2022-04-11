const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('food', {
    fid: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(455),
      allowNull: false
    },
    amount: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    chef: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'employees',
        key: 'empid'
      }
    }
  }, {
    sequelize,
    tableName: 'food',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "fid" },
        ]
      },
      {
        name: "fid_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "fid" },
        ]
      },
      {
        name: "chef_id_idx",
        using: "BTREE",
        fields: [
          { name: "chef" },
        ]
      },
    ]
  });
};
