const express = require('express');
const router = express.Router();

const Model = require('../models/appliance');

//Post Method
router.post('/post', async (req, res) => {
    const data = new Model({
        name: req.body.name,
        description: req.body.description,
        measurements: req.body.measurements
    })

    try {
        const dataToSave = await data.save();
        res.status(200).json(dataToSave)
    }
    catch (error) {
        res.status(400).json({message: error.message})
    }
})

//Get all Method
router.get('/getAll', async (req, res) => {
    try{
        const data = await Model.find();
        // for each appliance, find the sum of the measurements by month
        const monthlySumByAppliance = {};
        data.map(appliance => {
            monthlySumByAppliance[appliance.name] = {};
            monthlySumByAppliance[appliance.name]['_id'] = appliance._id
            let sum = [0,0,0,0,0,0,0,0,0,0,0,0];
            for (let j = 0; j < appliance.measurements.length; j++) {
                sum[appliance.measurements[j].date.getMonth()] += appliance.measurements[j].amount;
            }
            monthlySumByAppliance[appliance.name]['measurementsByMonth'] = sum;
            monthlySumByAppliance[appliance.name]['measurementsTotal'] = sum.reduce((a, b) => a + b, 0);
        }
        );
        res.status(200).json(monthlySumByAppliance)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Get Consumption Method
router.get('/getConsumption', async (req, res) => {
    try{
        const data = await Model.find();
        // calculate the sum of the measurements by month and store it in a list
        let sum = [0,0,0,0,0,0,0,0,0,0,0,0];
        for (let i = 0; i < data.length; i++) {
            for (let j = 0; j < data[i].measurements.length; j++) {
                sum[data[i].measurements[j].date.getMonth()] += data[i].measurements[j].amount;
            }
        }
        res.status(200).json(sum)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Get appliances name Method
router.get('/getAppliances', async (req, res) => {
    try{
        const data = await Model.find();
        console.log(data);
        const appliances = [];
        data.map(appliance => {
            appliances.push(appliance.name);
        }
        );
        res.status(200).json(appliances)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Get by ID Method
router.get('/getOne/:id', async (req, res) => {
    try{
        const data = await Model.findById(req.params.id);
        // calculate the total consumption of the appliance, as well as the total consumption per month
        let total = 0;
        let sum = [0,0,0,0,0,0,0,0,0,0,0,0];
        for (let j = 0; j < data.measurements.length; j++) {
            total += data.measurements[j].amount;
            sum[data.measurements[j].date.getMonth()] += data.measurements[j].amount;
        }
        let newData = {
            '_id': data._id,
            'name': data.name,
            'measurementsByMonth': sum,
            'measurementsTotal': total
        }
        res.status(200).json(newData)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Delete all Method
router.delete('/deleteAll', async (req, res) => {
    try{
        const data = await Model.deleteMany();
        res.send(`Document with ${data.name} has been deleted..`)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Delete by ID Method
router.delete('/delete/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const data = await Model.findByIdAndDelete(id)
        res.send(`Document with ${data.name} has been deleted..`)
    }
    catch (error) {
        res.status(400).json({ message: error.message })
    }
})

module.exports = router;
