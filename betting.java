/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package betting.multiplayer;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Isaac
 */
public class BettingMultiplayer {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc = new Scanner(System.in);
        Random gen = new Random();  
        
        int Players; 
        int end = 0;
        
        System.out.println("The aim of the game is to try and get as many coins as you can");
        System.out.println("without reaching 0 coins. Once you run out of coins, its game over!");
        System.out.println("To win coins you need to place a guess between 1 and 6 and place a bet. If you");
        System.out.println("guess correct, you win double what you betted! Good luck!!!");
        System.out.println("");
        System.out.println("How many players are there?");
        Players = sc.nextInt();
        
        int [] coins = new int [Players];
        String [] name = new String[Players];
        int [] bet = new int[Players];
        int [] guess = new int[Players];
        
            for (int i = 0; i < Players; i++) {
            System.out.println("Enter name for player "+(i+1)+":");
            name[i]=sc.next();
            coins[i]=500;
        }
       while (end < Players){
           for (int n = 0; n < Players; n++) {
               System.out.println(name[n]+" : "+coins[n]+" coins.");
               
           }
           System.out.println("");
           System.out.println("========================================");
           System.out.println("");
           for (int a = 0; a < Players; a++) {
               if(coins[a]>0){
               System.out.println(name[a]+", place a bet:");
               bet[a]=sc.nextInt();
               while (bet[a]>coins[a]||bet[a]<1){
                   System.out.println("Invalid bet! Place bet again: ");
                   bet[a]=sc.nextInt();
               }}
               System.out.println(name[a]+", guess what the die is going to roll.");
               guess[a]=sc.nextInt();
               while(guess[a]<1||guess[a]>6){
                   System.out.println("Invaild guess. Guess again:");
                   guess[a]=sc.nextInt();
               }
           }
           int dice=gen.nextInt(6)+1;
           System.out.println("The dice rolled "+dice);
           for (int b = 0; b < Players; b++) {
               if(coins[b]>0){
               if(guess[b]==dice){
                   System.out.println(name[b]+" you guessed correct!");
                   coins[b]=coins[b]+bet[b];
               }
               else{
                   System.out.println(name[b]+" you guessed wrong!");
                   coins[b]=coins[b]-bet[b];
               }
               if(coins[b]==0){
                   System.out.println(name[b]+" its game over for you!!! Better luck next time");
                   end=end+1;
               }
           }
           }
           
       }
    }
    
}
