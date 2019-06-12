use std::io::{self, Write};
use rand::Rng;
use std::cmp::Ordering;

fn main() {
    write("Upper Bound: ");

    let upper: u32 = get_int();    
    let secret: u32 = rand_int(upper);

    loop {
        write("Guess: ");
        let guess: u32 = get_int();
        
        match guess.cmp(&secret) {
            Ordering::Less => println!("Too low."),
            Ordering::Greater => println!("Too high."),
            Ordering::Equal => {
                println!("Correct!");
                break;
            },
        }
    }
}

fn write(s: &str) {
    print!("{}", s);
    io::stdout().flush().unwrap();
}

fn get_int() -> u32 {
    let mut n = String::new();
    io::stdin()
        .read_line(&mut n)
        .expect("failed to read input");

    let n: u32 = n.trim().parse().unwrap();
    return n;
}

fn rand_int(upper: u32) -> u32 {
    let rand: u32 = rand::thread_rng().gen_range(1, upper + 1);
    return rand;
}
