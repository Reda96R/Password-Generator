<div id="top"></div>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->




<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Reda96R/Password-Generator">
    <img src="logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Password-Generator</h3>


</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#script-summary">Script summary</a></li>
    <li><a href="#generating-a-random-password">Generating a random password</a></li>
    <li><a href="#printing-the-password">Printing the password</a></li>
    <li><a href="#the-script">The script</a></li>
    <li><a href="#note">Note</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
    
    
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
We all find ourselves in situations where you need a new random password that you can use for any software installation or when you sign-up to any website.
There are a lot of options out there in order to achieve this. You can use a password manager/vault where you often have the option to randomly generate a password or to use a website that can generate the password on your behalf.
I made a small Shell script (command-line) to generate a password that I can quickly use.

### Built With
* [Shell](https://www.shellscript.sh/)


## Script summary
 First, let's do a quick summary of what the script is going to do:
 1. The script will give the user the chance to choose the password length when it's executed.
 2. The script will then generate a random password with the length that was specified in step 1.


<!-- Generate a random password-->
## Generating a random password
We can use several commands in order to generate a random string of characters.
for this operation I'm going for the <strong>pseudorandom number generator</strong> <a target="_blank" href="https://en.wikipedia.org/wiki/Pseudorandom_number_generator">`/dev/urandom`</a> which is an algorithm that uses mathematical formulas to produce sequences of random numbers. PRNGs generate a sequence of numbers approximating the properties of random numbers.
<h4>How PRNG works?</h4>
<a href= "https://en.wikipedia.org/wiki/Linear_congruential_generator">Linear Congruential Generator</a> is the go for algorithm for generating pseudo-randomized numbers. The generator is defined by the recurrence relation:

```sh
Xn+1 = (aXn + c) mod m
where X is the sequence of pseudo-random values
m, 0 < m  - modulus 
a, 0 < a < m  - multiplier
c, 0 ≤ c < m  - increment
x0, 0 ≤ x0 < m  - the seed or start value
  ```
To generate the next random integer we use the previous random integer, the integer constants, and the integer modulus. and to get started, the algorithm requires an initial Seed(value), which must be provided by some means. The appearance of randomness is provided by performing modulo arithmetic.


## Printing the password
To print the generated password, I used  <a href="https://man7.org/linux/man-pages/man1/strings.1.html">`Strings`</a>, with this command I can take the output from `/dev/urandom`, and `Srtings` extracts strings of printable characters so that other commands can use the strings without having to contend with non-printable characters.<br><br>
next I used <a href= "https://linux.die.net/man/1/grep">`grep`</a>, it searches the given file(in our case the output from `Strings`) for lines containing a match to the given strings or words, `-o(--only-matching)` which helps us display only matched parts of lines, in our case `[:alnum:]` which is any of `[:digit:]` or `[:alpha:]` (in other words means `[0-9A-Za-z]`, except the latter form is dependent upon the ASCII character encoding).<br><br>
Then we'll use <a href="https://linux.die.net/man/1/head">`head`</a>, this command is generally used to display the top lines in a text file. We use `-n (--lines=[-]NUM)` that prints the first NUM lines (specified by the user) instead of the first 10; with the leading '-', print all but the last NUM lines of the file.<br><br>
Last I used <a href="https://linuxcommand.org/lc3_man_pages/tr1.html">`tr`</a>, which can be used to translate, squeeze, and delete characters from standard input, writing to standard output in Linux and Unix, in our case, we needed it so we can delete new lines (`-d '\n'`), and to have the generated password in one line so the user can easily copy it.



## The script
First we begin the script with the shebang  `#!/bin/bash
`, we use it to tell the operating system which interpreter to use to parse the rest of the file.
next we ask the user for some input. In our case we would like to know how many characters the password needs to be
```sh
#!/bin/bash
clear
echo "How many characters you would like the password to have?"
read i
```
at last, generate the passwords and then print it so the user can use it.
```sh
#!/bin/bash
clear
echo "How many characters you would like the password to have?"
read i
echo "Password is:"
strings /dev/urandom | grep -o '[[:alnum:]]' | head -n $i | tr -d '\n'
```
## Note
While the script is working fine, it expects that the user will provide the requested input. In order to prevent any issues I will make sure to do some more advance checks on the user input in the future commits in order to make sure the script will continue to work fine even if the provided input does not match our needs.
<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->
## Contact

Reda Rayyad - [Twitter](https://twitter.com/reda_rayyad) - [Instagram](https://www.instagram.com/reda_rayyad/) - redarayyad@yahoo.com

Project Link: [https://github.com/Reda96R/Password-Generator](https://github.com/Reda96R/Password-Generator)

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
Here you can find some of the resources that I found helpful while making this script
* [PasswordGenerator made in a diffrent way](https://github.com/AlexisAhmed/Shell-Scripts/blob/master/PasswordGenerator.sh)
* [How to Use the strings Command ](https://www.howtogeek.com/427805/how-to-use-the-strings-command-on-linux/)
* [Pseudo Random Number Generator](https://www.geeksforgeeks.org/pseudo-random-number-generator-prng/)
* [Linear congruential generator](https://en.wikipedia.org/wiki/Linear_congruential_generator)
* [This amazing Readme Template made by @othneildrew](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#top">back to top</a>)</p>




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Reda96R/Password-Generator.svg?style=for-the-badge
[contributors-url]: https://github.com/Reda96R/Password-Generator/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Reda96R/Password-Generator.svg?style=for-the-badge
[forks-url]: https://github.com/Reda96R/Password-Generator/network/members
[stars-shield]: https://img.shields.io/github/stars/Reda96R/Password-Generator.svg?style=for-the-badge
[stars-url]: https://github.com/Reda96R/Password-Generator/stargazers
[issues-shield]: https://img.shields.io/github/issues/Reda96R/Password-Generator.svg?style=for-the-badge
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/reda_rayyad