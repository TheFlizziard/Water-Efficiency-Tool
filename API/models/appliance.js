const mongoose = require('mongoose');

const dataSchema = new mongoose.Schema({
    name: {
        required: true,
        type: String
    },
    description: {
        required: false,
        type: String
    },
    measurements: [
        {
            date: {
                required: true,
                type: Date
            },
            amount: {
                required: true, 
                type: Number
            }
        }
    ]
})

module.exports = mongoose.model('Appliances', dataSchema)