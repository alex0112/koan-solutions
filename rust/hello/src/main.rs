use std::io;
use rand::Rng;

fn main() {
    println!("Upper: ");
    let upper: u32 = get_int();
    println!("Secret: {:#?}", rand_int(upper));
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
