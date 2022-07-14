//mongoose mongodb database model that captures crew details
const mongoose = require("mongoose");

const crewSchema = mongoose.Schema({
  crew_id: { type: String, required: true },
  crew_name: { type: String, required: true },
  crew_email: { type: String, required: true },
  crew_password: { type: String, required: true },
  crew_phone: { type: String, required: true },
  crew_address: { type: String, required: true },
  crew_city: { type: String, required: true },
  crew_state: { type: String, required: true },
  crew_zip: { type: String, required: true },
  crew_country: { type: String, required: true },
  crew_status: { type: String, required: true },
  crew_created_date: { type: Date, required: true },
  crew_updated_date: { type: Date, required: true },
  crew_last_login: { type: Date, required: true },
  crew_last_logout: { type: Date, required: true },
  crew_login_count: { type: Number, required: true },
  crew_login_ip: { type: String, required: true },
  crew_login_browser: { type: String, required: true },
  crew_login_os: { type: String, required: true },
});

//module export
module.exports = mongoose.model("Crew", crewSchema);
