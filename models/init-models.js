var DataTypes = require("sequelize").DataTypes;
var _administrator = require("./administrator");
var _customers = require("./customers");
var _employees = require("./employees");
var _food = require("./food");
var _invoice = require("./invoice");
var _orders = require("./orders");
var _pop = require("./pop");
var _sequelizemeta = require("./sequelizemeta");
var _table_reservation = require("./table_reservation");

function initModels(sequelize) {
  var administrator = _administrator(sequelize, DataTypes);
  var customers = _customers(sequelize, DataTypes);
  var employees = _employees(sequelize, DataTypes);
  var food = _food(sequelize, DataTypes);
  var invoice = _invoice(sequelize, DataTypes);
  var orders = _orders(sequelize, DataTypes);
  var pop = _pop(sequelize, DataTypes);
  var sequelizemeta = _sequelizemeta(sequelize, DataTypes);
  var table_reservation = _table_reservation(sequelize, DataTypes);

  orders.belongsTo(customers, { as: "customer", foreignKey: "customerid"});
  customers.hasMany(orders, { as: "orders", foreignKey: "customerid"});
  administrator.belongsTo(employees, { as: "emp", foreignKey: "empid"});
  employees.hasMany(administrator, { as: "administrators", foreignKey: "empid"});
  food.belongsTo(employees, { as: "chef_employee", foreignKey: "chef"});
  employees.hasMany(food, { as: "foods", foreignKey: "chef"});
  orders.belongsTo(employees, { as: "attender_employee", foreignKey: "attender"});
  employees.hasMany(orders, { as: "orders", foreignKey: "attender"});
  orders.belongsTo(food, { as: "food", foreignKey: "foodid"});
  food.hasMany(orders, { as: "orders", foreignKey: "foodid"});
  pop.belongsTo(food, { as: "fid_food", foreignKey: "fid"});
  food.hasMany(pop, { as: "pops", foreignKey: "fid"});
  customers.belongsTo(invoice, { as: "invoice", foreignKey: "invoiceid"});
  invoice.hasMany(customers, { as: "customers", foreignKey: "invoiceid"});
  orders.belongsTo(invoice, { as: "invoice", foreignKey: "invoiceid"});
  invoice.hasMany(orders, { as: "orders", foreignKey: "invoiceid"});
  pop.belongsTo(invoice, { as: "invoice", foreignKey: "invoiceid"});
  invoice.hasMany(pop, { as: "pops", foreignKey: "invoiceid"});

  return {
    administrator,
    customers,
    employees,
    food,
    invoice,
    orders,
    pop,
    sequelizemeta,
    table_reservation,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
