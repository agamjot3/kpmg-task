// Importations
import express from 'express';
import fetch from 'node-fetch';
import bodyParser from 'body-parser';

//Application Declarations & Initialization
const app = express();
const PORT = 3000;
const METADATA_URL = 'http://169.254.169.254/latest/meta-data/';

app.use(bodyParser.json());

//Function to fetch meta data with token IMDSv2
async function fetchMetadata(path = '') {
    try {
        const tokenResponse = await fetch('http://169.254.169.254/latest/api/token', {
            method: 'PUT',
            headers: {
                'X-aws-ec2-metadata-token-ttl-seconds': '21600'
            }
        });

        if (!tokenResponse.ok) {
            throw new Error(`Failed to fetch metadata token: ${tokenResponse.statusText}`);
        }

        const token = await tokenResponse.text();

        const response = await fetch(`${METADATA_URL}${path}`, {
            headers: {
                'X-aws-ec2-metadata-token': token
            }
        });

        if (!response.ok) {
            throw new Error(`Failed to fetch metadata: ${response.statusText}`);
        }

        const data = await response.text();
        return data;
    } catch (error) {
        console.error('Error fetching instance metadata:', error.message);
        throw error;
    }
}

// API to fetch all metadata
app.get('/api/getMetadata', async (req, res) => {
    try {
        const fields = await fetchMetadata();
        const fieldArray = fields.split('\n');
        const metadata = {};
        for (const field of fieldArray) {
            if (field.trim() !== '') {
                const value = await fetchMetadata(field);
                metadata[field] = value;
            }
        }
        res.send(metadata);
    } catch (error) {
        res.status(500).send({ error: 'Internal server error' });
    }
});

// API to fetch specific metadata
app.post('/api/getMetadata', async (req, res) => {
    try {
        const { field } = req.body;
        if (!field) {
            return res.status(400).send({ error: 'A metadata field must be specified.' });
        }
        const data = await fetchMetadata(field);
        res.send(data);
    } catch (error) {
        console.error('Error fetching instance metadata:', error.message);
        res.status(500).send({ error: 'Internal server error' });
    }
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});