# CPU Scaling
Intel Core i3-7100U (2.4Ghz, 3MB L3 Cache)

# CPU SET & SET AFFINITY
Set affinity mask to include CPUs  
Then check the actual affinity mask assigned to the thread  
CPU_ISSET(j, &cpuset)

# ISSUE
I thought I've already done this task and was absolutely 
confident about working abilities of this program. 
But there is a problem: on PC or laptops with four plus 
physical cores core_id doesn't represent physical core number.
So I have to find out how to parse cpu's info and analyse the data.
Maybe I am to create a new data structure to save the core id and smth else
