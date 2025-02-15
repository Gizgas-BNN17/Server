//import Prisma 
const prisma = require('../config/prisma')
const stripe = require('stripe')('sk_test_51QsgDTQPgSPjEpO9lmbVWZaxK0igc1xamZxSo0EGdCDhhtqkPkDborIz6vvVw3OaVxraucEqVKzvil9NyvKD3oDj00ZDxlGjv4');

exports.payment = async (req, res) => {
  const YOUR_DOMAIN = 'http://localhost:5000/api/create-checkout-session';
  try {
    const session = await stripe.checkout.sessions.create({
      line_items: [
        {
          // Provide the exact Price ID (for example, pr_1234) of the product you want to sell
          price: 'plink_1QsgntQPgSPjEpO9CYMSZcef',
          quantity: 1,
        },
      ],
      mode: 'payment',
      success_url: `${YOUR_DOMAIN}?success=true`,
      cancel_url: `${YOUR_DOMAIN}?canceled=true`,
    });
    res.redirect(303, session.url);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Server Error" });
  }
}