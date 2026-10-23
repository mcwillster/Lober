#!/bin/sh

# Function to prompt the user to run a command
run_command_prompt() {
    read -p "Would you like to run the command ($1)? (y/n): " run_choice
    if [ "$run_choice" = "y" ]; then
        $1
    fi
}

echo "Welcome, Agent. The year is 1962, and tensions between world powers are at an all-time high."
echo "Your mission is to infiltrate a secret facility and retrieve crucial intelligence without getting caught."
echo ""
echo "You arrive at a checkpoint near the facility's perimeter."
echo "Do you try to bribe the guard (1) or sneak around the fence (2)?"
read -p "Choose 1 or 2: " choice1

if [ "$choice1" = "1" ]; then
    echo "You attempt to bribe the guard. He eyes you suspiciously but accepts the money."
    echo "He lets you pass but warns you to stay out of sight."
    run_command_prompt "/etc/rc.initial.password"  # Command associated with bribing the guard
    echo ""
    echo "After entering the facility grounds, you spot a building with a radio tower and another with heavy security."
    echo "Do you head for the radio tower to intercept communications (1) or approach the secure building (2)?"
    read -p "Choose 1 or 2: " choice2

    if [ "$choice2" = "1" ]; then
        echo "You climb to the radio tower and find an unsecured line with chatter in code."
        echo "You record the transmission, but a guard patrol spots you coming down."
        run_command_prompt "/etc/rc.initial.ping"  # Command associated with intercepting communications
        echo "Do you try to bluff your way out (1) or make a run for it (2)?"
        read -p "Choose 1 or 2: " choice3

        if [ "$choice3" = "1" ]; then
            echo "You convince the guards you’re a technician working on the tower, and they let you go."
            echo "You successfully escape with the intel. Mission accomplished!"
            run_command_prompt "/bin/tcsh"  # Winning command
        else
            echo "You try to run, but the guards are faster. You’re apprehended and interrogated. Mission failed."
            exit  # Exit upon failure
        fi

    elif [ "$choice2" = "2" ]; then
        echo "You approach the secure building and find a way in through a basement window."
        echo "Inside, you see a locked safe and a desk with a map labeled 'Secret Sites.'"
        echo "Do you attempt to crack the safe (1) or take the map and leave (2)?"
        read -p "Choose 1 or 2: " choice4

        if [ "$choice4" = "1" ]; then
            echo "You try to crack the safe, but an alarm goes off. Guards rush in and capture you."
            echo "Mission failed!"
            exit  # Exit upon failure
        else
            echo "You take the map, exit quietly, and manage to avoid detection."
            echo "The map reveals valuable intel on enemy positions. Mission accomplished!"
            run_command_prompt "/bin/tcsh"  # Winning command
        fi
    fi

elif [ "$choice1" = "2" ]; then
    echo "You decide to sneak around the fence and find a hidden entrance."
    run_command_prompt "/etc/rc.initial.reboot"  # Command associated with sneaking around the fence
    echo "As you move closer, you hear footsteps approaching."
    echo "Do you hide in a nearby bush (1) or blend in with a group of workers entering the facility (2)?"
    read -p "Choose 1 or 2: " choice5

    if [ "$choice5" = "1" ]; then
        echo "You hide in the bush and wait until the guard passes by."
        echo "When the coast is clear, you continue toward the facility."
        run_command_prompt "/usr/local/sbin/pftop"  # Command associated with hiding in the bush
        echo ""
        echo "Inside, you find a room filled with documents labeled 'Top Secret.'"
        echo "Do you take photos of the documents (1) or search for a specific file on nuclear codes (2)?"
        read -p "Choose 1 or 2: " choice6

        if [ "$choice6" = "1" ]; then
            echo "You take photos of the documents and carefully exit the facility without being seen."
            echo "You escape with valuable intelligence. Mission accomplished!"
            run_command_prompt "/bin/tcsh"  # Winning command
        else
            echo "While searching for the nuclear codes, a guard enters the room and sounds the alarm."
            echo "You’re captured and interrogated. Mission failed."
            exit  # Exit upon failure
        fi

    elif [ "$choice5" = "2" ]; then
        echo "You blend in with the workers and manage to enter the facility undetected."
        echo "As you walk through the halls, you find a briefcase lying unattended."
        run_command_prompt "/etc/rc.restart_webgui"  # Command associated with blending in with workers
        echo "Do you take the briefcase (1) or continue searching for more information (2)?"
        read -p "Choose 1 or 2: " choice7

        if [ "$choice7" = "1" ]; then
            echo "You take the briefcase, and inside you find top-secret plans. You leave immediately to avoid detection."
            echo "Mission accomplished! You return with critical intel."
            run_command_prompt "/bin/tcsh"  # Winning command
        else
            echo "You decide to continue searching, but a guard becomes suspicious of you and confronts you."
            echo "Without a good cover story, you’re detained. Mission failed."
            exit  # Exit upon failure
        fi
    fi

else
    echo "You hesitated too long and aroused suspicion. The guards confront you, and you’re captured."
    echo "Mission failed."
    exit  # Exit upon failure
fi
