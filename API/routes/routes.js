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
        console.log(data);
        // print datatype of date in measurements
        console.log(data[0].measurements[0].date);
        // print the month of the date in measurements
        console.log(data[0].measurements[0].date.getMonth());
        // for each appliance, find the sum of the measurements by month
        const monthlySumByAppliance = {};
        data.map(appliance => {
            monthlySumByAppliance[appliance.name] = {};
            let sum = [0,0,0,0,0,0,0,0,0,0,0,0];
            for (let j = 0; j < appliance.measurements.length; j++) {
                sum[appliance.measurements[j].date.getMonth()] += appliance.measurements[j].amount;
            }
            monthlySumByAppliance[appliance.name]['measurementsByMonth'] = sum;
            monthlySumByAppliance[appliance.name]['measurementsTotal'] = sum.reduce((a, b) => a + b, 0);
            console.log(sum);
        }
        );
        res.status(200).json(monthlySumByAppliance)
    }
    catch(error){
        res.status(500).json({message: error.message})
    }
})

//Get by ID Method
router.get('/getOne/:id', async (req, res) => {
    try{
        const data = await Model.findById(req.params.id);
        res.json(data)
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
