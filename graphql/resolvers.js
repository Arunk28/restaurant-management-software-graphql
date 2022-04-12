const {
  employees,
  food,
  pop,
  invoice,
  orders,
  customers,
  table_reservation,
} = require("../models");

const Query = {
  getEmployeeDetails: async () => {
    try {
      const allemployees = await employees.findAll();
      return allemployees;
    } catch (err) {
      console.log(err);
    }
  },
  getFoodDetails: async () => {
    try {
      const foods = await food.findAll();
      return foods;
    } catch (err) {
      console.log(err);
    }
  },
  getpops: async () => {
    try {
      const pops = await pop.findAll();
      return pops;
    } catch (err) {
      console.log(err);
    }
  },
  getinvoice: async () => {
    try {
      const invoices = await invoice.findAll();
      return invoices;
    } catch (err) {
      console.log(err);
    }
  },
  getorders: async () => {
    try {
      const order = await orders.findAll();
      return order;
    } catch (err) {
      console.log(err);
    }
  },
  getcustomers: async () => {
    try {
      const customer = await customers.findAll();
      return customer;
    } catch (err) {
      console.log(err);
    }
  },
  getfoods: async () => {
    try {
      const foods = await food.findAll();
      return foods;
    } catch (err) {
      console.log(err);
    }
  },
  gettables: async () => {
    try {
      const tables = await table_reservation.findAll();
      return tables;
    } catch (err) {
      console.log(err);
    }
  },
};

const Mutation = {
  createEmployee: async (
    root,
    { empid, name, salary, joiningdate, address, designation }
  ) => {
    try {
      return await employees.create({
        name,
        salary,
        joiningdate,
        address,
        designation,
      });
    } catch (err) {
      console.log(err);
    }
  },
};

const Food = {
  employee: (food) => {
    return employees.findByPk(food.chef);
  },
};

const Pop = {
  food: (pop) => {
    return food.findByPk(pop.fid);
  },
  invoice: (pop) => {
    return invoice.findByPk(pop.invoiceid);
  },
};

const Invoice = {
  pop: (invoice) => {
    return pop.findAll({
      where: {
        invoiceid: invoice.invoiceid,
      },
    });
  },
  order: (invoice) => {
    return orders.findAll({
      where: {
        invoiceid: invoice.invoiceid,
      },
    });
  },
  customer: (invoice) => {
    return customers.findAll({
      where: {
        invoiceid: invoice.invoiceid,
      },
    });
  },
};

const Customers = {
  invoice: (customer) => {
    return invoice.findByPk(customer.invoiceid);
  },
};

const Tables = {
  customer: (table) => {
    return customers.findByPk(table.customerid);
  },
};
const Orders = {
  invoice: (order) => {
    return food.findByPk(order.invoiceid);
  },
  food: (order) => {
    return food.findByPk(order.foodid);
  },
  attender: (order) => {
    return employees.findByPk(order.attender);
  },
};
module.exports = {
  Query,
  Food,
  Pop,
  Invoice,
  Customers,
  Orders,
  Tables,
  Mutation,
};
