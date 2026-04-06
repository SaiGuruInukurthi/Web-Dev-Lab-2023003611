import React, { useState } from "react";

export default function CareerForm() {
    const [candidateData, setCandidateData] = useState({
        fullName: "",
        emailId: "",
        jobRole: ""
    });

    const handleChange = (e) => {
        setCandidateData({ ...candidateData, [e.target.name]: e.target.value });
    };

    return (
        <div style={{ fontFamily: "sans-serif", padding: "20px" }}>
            <h2>React Careers Form</h2>
            <div style={{ marginBottom: "15px" }}>
                <input type="text" name="fullName" placeholder="Full Name" onChange={handleChange} /><br/><br/>
                <input type="email" name="emailId" placeholder="Email Address" onChange={handleChange} /><br/><br/>
                <input type="text" name="jobRole" placeholder="Desired Role" onChange={handleChange} />
            </div>

            <div style={{ padding: "10px", border: "1px solid #333", display: "inline-block" }}>
                <strong>Application Summary:</strong>
                <p>Name: {candidateData.fullName}</p>
                <p>Email: {candidateData.emailId}</p>
                <p>Role: {candidateData.jobRole}</p>
            </div>
        </div>
    );
}
