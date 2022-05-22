const store = require("../model/store");
const fs=require("fs")
const multer = require("multer");
const path = require("path");


const multerConfig=multer.diskStorage({
  destination:(req,file,callback)=>{
    console.log("step 1")
    callback(null,'upload/images')
  },
  filename:(req,file,callback)=>{
    const ext=file.mimetype.split('/')[1]
    console.log("step 2")
    callback(null,`image-${Date.now()}.${ext}`)
}})


const isImage=(req,file,callback)=>{
    if(file.mimetype.startsWith('image'))
    {
      console.log("if")
        callback(null,true)
    }else{
      console.log("else")
      callback(new Error('Only image is allowed'))
    }
}

const upload=multer({
  storage:multerConfig,
  fileFilter:isImage,
})

exports.uploadImage=upload.single('banner')
exports.upload=(req,res)=>{
  console.log(req.file,req.body)
}
exports.create = (req, res) => {
  console.log("step 3")
  const root=path.join(__dirname,'../')
  store
    .create({
      storeName: req.body.name,
      seating: req.body.seating,
//     banner:fs.readFileSync(root +"\\upload\\images\\" + req.file.filename)
    })
    .then((data) => {
      console.log(data)
      res.send("Added Successfully");
    })
    .catch((err) => console.log(err));
};

exports.get = (req, res) => {
  store
    .find({})
    .then((data) => {
      res.send(data);
    })
    .catch((err) => console.log(err));
};

exports.getOne = (req, res) => {
  console.log(req.body.id);
  store
    .findOne({ _id: req.body.id })
    .then((data) => {
      res.send(data);
    })
    .catch((err) => console.log(err));
};

exports.delete = (req, res) => {
  console.log(req.body);
  store
    .deleteOne({ _id: req.params.id })
    .then((data) => {
      res.send("Store Deleted");
    })
    .catch((err) => {
      console.log(err);
    });
};
