<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>

<h1>📄 AWS Resource Listing using Shell Script and AWS CLI</h1>

<hr>

<h2>📌 Project Description</h2>
<p>
This project is a <strong>shell script</strong> that lists AWS resources from an AWS account
using <strong>AWS CLI</strong>.
</p>
<p>
The script accepts:
</p>
<ul>
    <li>AWS <strong>region</strong></li>
    <li>AWS <strong>service name</strong></li>
</ul>
<p>
Based on the service provided, it lists the corresponding AWS resources.
</p>

<p>
This project helped me understand:
</p>
<ul>
    <li>Shell scripting basics</li>
    <li>Argument handling in shell</li>
    <li>AWS CLI usage</li>
    <li>Debugging real DevOps issues</li>
</ul>

<hr>

<h2>🛠️ Tools & Technologies Used</h2>
<ul>
    <li>Shell Scripting (Bash)</li>
    <li>AWS CLI</li>
    <li>AWS Account</li>
    <li>Git & GitHub</li>
    <li>macOS / Linux Terminal</li>
</ul>

<hr>

<h2>📂 Project Structure</h2>
<pre>
aws_resource_list.sh
README.html
</pre>

<hr>

<h2>🚀 Steps Followed in This Project</h2>

<h3>Step 1: Install AWS CLI</h3>
<p>Check if AWS CLI is installed:</p>
<pre>
aws --version
</pre>

<p>If not installed (macOS):</p>
<pre>
brew install awscli
</pre>

<p>Verify installation:</p>
<pre>
aws --version
</pre>

<hr>

<h3>Step 2: Configure AWS CLI</h3>
<p>Configure AWS CLI using:</p>
<pre>
aws configure
</pre>

<p>Provide:</p>
<ul>
    <li>AWS Access Key</li>
    <li>AWS Secret Access Key</li>
    <li>Default region (example: us-east-2)</li>
    <li>Output format (optional)</li>
</ul>

<p>Verify configuration:</p>
<pre>
aws sts get-caller-identity
</pre>

<hr>

<h3>Step 3: Create Shell Script</h3>
<pre>
touch aws_resource_list.sh
chmod 777 aws_resource_list.sh
</pre>

<p>The script includes:</p>
<ul>
    <li>Argument validation</li>
    <li>AWS CLI installation check</li>
    <li>AWS CLI configuration check</li>
    <li>Case statement for services</li>
</ul>

<hr>

<h3>Step 4: Handle Script Arguments</h3>
<p>The script expects <strong>two arguments</strong>:</p>
<pre>
./aws_resource_list.sh &lt;region&gt; &lt;service_name&gt;
</pre>

<p>Example:</p>
<pre>
./aws_resource_list.sh us-east-2 ec2
</pre>

<ul>
    <li><code>$1</code> → Region</li>
    <li><code>$2</code> → Service Name</li>
</ul>

<hr>

<h3>Step 5: Validate AWS CLI Installation</h3>
<pre>
aws --version &amp;&gt; /dev/null
</pre>

<p>If AWS CLI is not installed, the script exits with an error.</p>

<hr>

<h3>Step 6: Validate AWS CLI Configuration</h3>
<pre>
aws sts get-caller-identity
</pre>

<p>If credentials are missing, the script exits safely.</p>

<hr>

<h3>Step 7: List AWS Resources Using Case Statement</h3>
<p>Used a <strong>case</strong> statement to handle services:</p>
<pre>
case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
esac
</pre>

<p>This avoids multiple if-else conditions.</p>

<hr>

<h2>📌 Supported AWS Services</h2>
<ul>
    <li>EC2</li>
    <li>S3</li>
    <li>RDS</li>
    <li>DynamoDB</li>
    <li>Lambda</li>
    <li>EBS</li>
    <li>CloudFront</li>
    <li>CloudWatch</li>
    <li>SNS</li>
    <li>SQS</li>
    <li>Route53</li>
    <li>VPC</li>
    <li>CloudFormation</li>
    <li>IAM</li>
</ul>

<hr>

<h2>🧪 Sample Commands</h2>
<pre>
./aws_resource_list.sh us-east-2 ec2
./aws_resource_list.sh us-east-1 s3
./aws_resource_list.sh us-east-2 lambda
</pre>

<hr>

<hr>

<h2>📸 Sample Output Screenshots</h2>

<h3>EC2 Instances Output</h3>
<img width="2272" height="820" alt="image" src="https://github.com/user-attachments/assets/206168aa-3786-478d-81b9-13db0c952c8b" />


<p>
This screenshot shows the output of listing EC2 instances using the script.
</p>


<h2>❗ Common Issues Faced & Fixes</h2>

<h3>Issue 1: Invalid service even with correct input</h3>
<p><strong>Cause:</strong> Checked <code>$1</code> instead of <code>$2</code> in case statement.</p>
<p><strong>Fix:</strong></p>
<pre>
case $2 in
</pre>

<hr>

<h3>Issue 2: Wrong AWS endpoint URL</h3>
<p><strong>Cause:</strong> Incorrect region format.</p>
<p><strong>Fix:</strong> Use valid region like <code>us-east-2</code>.</p>

<hr>

<h3>Issue 3: Large EC2 JSON Output</h3>
<p><strong>Reason:</strong> <code>describe-instances</code> returns full details.</p>
<p><strong>Learning:</strong> Use <code>--query</code> and <code>--output table</code> later.</p>

<hr>

<h2>🌱 What I Learned</h2>
<ul>
    <li>AWS CLI working</li>
    <li>Shell script arguments</li>
    <li>Debugging real issues</li>
    <li>Writing reusable DevOps scripts</li>
    <li>Documenting projects properly</li>
</ul>

<hr>

<h2>🔮 Future Enhancements</h2>
<ul>
    <li>Add ELB support</li>
    <li>Improve output formatting</li>
    <li>Add logging</li>
    <li>Support multiple services</li>
</ul>

<hr>

<h2>👩‍💻 Author</h2>
<p>
<strong>Pavani</strong><br>
DevOps Engineer (Fresher)<br>
Learning by doing 🚀
</p>

</body>
</html>
