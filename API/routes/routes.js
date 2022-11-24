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
        res.json(data)
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
