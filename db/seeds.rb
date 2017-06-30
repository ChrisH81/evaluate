Batch.delete_all
Student.delete_all


batch1 = Batch.create!({name: "Batch1", start_date: "2017-05-15", end_date: "2017-07-12"})
batch2 = Batch.create!({name: "Batch2", start_date: "2017-06-26", end_date: "2017-08-01"})
batch3 = Batch.create!({name: "Batch3", start_date: "2017-07-23", end_date: "2017-09-12"})

Student.create!([
  { first_name: "Boba", last_name: "Fett", image: "https://www.sideshowtoy.com/photo_902491_thumb.jpg", batch: batch1 }
])
