import React, { useState } from 'react';
import axios from 'axios';

function CreateAssessment() {
    const [title, setTitle] = useState('');
    const [type, setType] = useState('quiz');
    const [questions, setQuestions] = useState([]);

    const handleSave = () => {
        axios.post('/api/assessments', { title, type, questions })
            .then(response => {
                // Handle success
                console.log(response.data);
            });
    };

    return (
        <div>
            <input type="text" value={title} onChange={e => setTitle(e.target.value)} placeholder="Assessment Title" />
            <select value={type} onChange={e => setType(e.target.value)}>
                <option value="quiz">Quiz</option>
                <option value="assignment">Assignment</option>
                <option value="survey">Survey</option>
            </select>
            {/* Question creation components */}
            <button onClick={handleSave}>Save as Draft</button>
            <button onClick={() => { handleSave(); /* Publish logic */ }}>Publish</button>
        </div>
    );
}

export default CreateAssessment;
