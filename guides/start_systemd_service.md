# Starting a Systemd Service for Flask app

Follow these steps to start a Systemd service for your Python Flask application.

1. **Create a Systemd Service File**:
   
   Create a new `.service` file for your Flask application, e.g., `my-flask-app.service`, in `/etc/systemd/system/`.

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

   If you want to use `gunicorn` then use:
   ```ini
   [Unit]
   Description=Gunicorn instance to serve my Flask app AdNotifier
   After=network.target

   [Service]
   User=indrajit
   WorkingDirectory=/home/path/to/your/app
   ExecStart=/home//path/to/your/app/env/bin/gunicorn --bind 0.0.0.0:5000 run:app

   [Install]
   WantedBy=multi-user.t
   ```

   Replace placeholders with your specific values.

2. **Reload Systemd**:
   
   Reload the Systemd configuration to load the new service:

   ```bash
   sudo systemctl daemon-reload
   ```

3. **Start the Service**:
   
   Start your Flask service:

   ```bash
   sudo systemctl start my-flask-app
   ```

4. **Enable Auto-Start (Optional)**:
   
   To start your service automatically at boot:

   ```bash
   sudo systemctl enable my-flask-app
   ```

5. **Check status**:

   ```bash
   sudo systemctl status my-flask-app
   ```

6. **Stop the Service**:
   
   To stop your Flask service at any time:

   ```bash
   sudo systemctl stop my-flask-app
   ```

7. **View Service Logs**:
   
   You can view the service logs using the following command:

   ```bash
   sudo journalctl -u my-flask-app
   ```
8. **List All Services**:
   
   To list all services, including active and inactive ones, you can use the following command:
   ```bash
   systemctl list-units --type=service --all
   ```
9. **Enable Auto-Start on Boot (Optional):**

   If you want your Flask application to start automatically when your server boots up, enable the service:
   ```bash
   sudo systemctl enable my-flask-app
   ```


10. **Restarting the Service:**
   If you've made modifications to the Python script, apply the changes and restart the service using the following commands:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl restart adnotifier.service
   ```