# Starting a Systemd Service for Flask app

Follow these steps to start a Systemd service for your Python Flask application.

1. **Create a Systemd Service File**:
   - Create a new `.service` file for your Flask application, e.g., `my-flask-app.service`, in `/etc/systemd/system/`.

   ```ini
   [Unit]
   Description=my-flask-app Flask Application

   [Service]
   User=your_username
   WorkingDirectory=/path/to/your/app
   ExecStart=/path/to/your/venv/bin/python /path/to/your/app/run.py
   Restart=always

   [Install]
   WantedBy=multi-user.target
   ```

   - Replace placeholders with your specific values.

2. **Reload Systemd**:
   - Reload the Systemd configuration to load the new service:

   ```bash
   sudo systemctl daemon-reload
   ```

3. **Start the Service**:
   - Start your Flask service:

   ```bash
   sudo systemctl start my-flask-app
   ```

4. **Enable Auto-Start (Optional)**:
   - To start your service automatically at boot:

   ```bash
   sudo systemctl enable my-flask-app
   ```

5. **Stop the Service**:
   - To stop your Flask service at any time:

   ```bash
   sudo systemctl stop my-flask-app
   ```

6. **View Service Logs**:
   - You can view the service logs using the following command:

   ```bash
   sudo journalctl -u my-flask-app
   ```


