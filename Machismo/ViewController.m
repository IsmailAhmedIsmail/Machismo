//
//  ViewController.m
//  Machismo
//
//  Created by Ismail Ahmed on 6/16/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) Deck * deck;
@property (strong,nonatomic) CardMatchingGame* game;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CardMatchingGame*) game
{
    if(!_game)
    {
        _game= [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    }
    return _game;
}
-(Deck*) deck
{
    if(!_deck)
    {
        _deck= [self createDeck];
    }
    return _deck;
}
-(Deck*) createDeck //abstract
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender {

    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}
-(void) updateUI
{
    for(UIButton* cardButton in self.cardButtons)
    {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card= [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self BackgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", [self.game score]];
}
-(NSString*) titleForCard: (Card*) card
{
    return card.isChosen? card.contents:@"";
}
-(UIImage*) BackgroundImageForCard: (Card*) card
{
    return  [UIImage imageNamed:card.isChosen? @"cardFront":@"cardBack"];
}
- (IBAction)Redeal:(id)sender {
    [self setGame:nil];
    [self updateUI];
    
}
@end
