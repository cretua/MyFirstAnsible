pipeline 
{
    agent any
	stages 
	{
		stage('Build') 
		{
			steps
			{
				dir('/var/lib/jenkins/ansible/MyFirstAnsible/ansible_code') 
				{
					sh 'ansible-playbook site.yml -i hosts'    
				}
			}
        } 
	  
		stage('Test') 
		{
		    steps
			{	
				sh 'curl 192.168.135.114'
		    }
		}
   
		stage('Deploy') 
		{
			steps
			{
				sh 'echo "Deploy was successful"'
		    }
		}
	}
}