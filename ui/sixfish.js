import $ from 'jquery';

/**
 * Sixfish Javascript
 *
 * @author Michael Granger <ged@FaerieMUD.org>
 *
 * Copyright © 2012-2022, Michael Granger
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of the author/s, nor the names of the project's
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
*/

$(document).ready( () => {
	console.debug("Setting up sixfish.");

	hookMethodSourceToggles()
	hookSearchField()
})


function hookMethodSourceToggles() {
	$('div.method i').on( 'click', (ev) => {
		let icon = ev.target;
		let method_div = $(icon).parents( 'div' ).get(0);
		let source = $(method_div).find( 'div.method-source-code' );

		console.debug( "Toggling: %o", source );
		source.fadeToggle();
	})
}


function hookSearchField() {
	let el = $('input#index-search')

	el.on( 'input', function(ev) {
		let term = el.val()
		if ( term === null || term === '' ) {
			unfilterIndex()
		} else {
			filterIndex( term )
		}
	})
}


function filterIndex( term ) {
	let lterm = term.toLowerCase();
	$('li[data-search-term]').filter( (idx, el) => {
		let thisTerm = $(el).attr('data-search-term').toLowerCase();
		return ! thisTerm.includes( lterm )
	}).each( (idx, el) => $(el).fadeOut() )
}


function unfilterIndex() {
	$('li[data-search-term]').fadeIn();
}


/*!
 * string_score.js: String Scoring Algorithm 0.1.10
 *
 * http://joshaven.com/string_score
 * https://github.com/joshaven/string_score
 *
 * Copyright (C) 2009-2011 Joshaven Potter <yourtech@gmail.com>
 * Special thanks to all of the contributors listed here https://github.com/joshaven/string_score
 * MIT license: http://www.opensource.org/licenses/mit-license.php
 *
 * Date: Tue Mar 1 2011
*/

/**
 * Scores a string against another string.
 *  'Hello World'.score('he');     //=> 0.5931818181818181
 *  'Hello World'.score('Hello');  //=> 0.7318181818181818
 */
String.prototype.score = function(abbreviation, fuzziness) {
  // If the string is equal to the abbreviation, perfect match.
  if (this == abbreviation) {return 1;}
  //if it's not a perfect match and is empty return 0
  if(abbreviation == "") {return 0;}

  var total_character_score = 0,
      abbreviation_length = abbreviation.length,
      string = this,
      string_length = string.length,
      start_of_string_bonus,
      abbreviation_score,
      fuzzies=1,
      final_score;

  // Walk through abbreviation and add up scores.
  for (var i = 0,
         character_score/* = 0*/,
         index_in_string/* = 0*/,
         c/* = ''*/,
         index_c_lowercase/* = 0*/,
         index_c_uppercase/* = 0*/,
         min_index/* = 0*/;
     i < abbreviation_length;
     ++i) {

    // Find the first case-insensitive match of a character.
    c = abbreviation.charAt(i);

    index_c_lowercase = string.indexOf(c.toLowerCase());
    index_c_uppercase = string.indexOf(c.toUpperCase());
    min_index = Math.min(index_c_lowercase, index_c_uppercase);
    index_in_string = (min_index > -1) ? min_index : Math.max(index_c_lowercase, index_c_uppercase);

    if (index_in_string === -1) {
      if (fuzziness) {
        fuzzies += 1-fuzziness;
        continue;
      } else {
        return 0;
      }
    } else {
      character_score = 0.1;
    }

    // Set base score for matching 'c'.

    // Same case bonus.
    if (string[index_in_string] === c) {
      character_score += 0.1;
    }

    // Consecutive letter & start-of-string Bonus
    if (index_in_string === 0) {
      // Increase the score when matching first character of the remainder of the string
      character_score += 0.6;
      if (i === 0) {
        // If match is the first character of the string
        // & the first character of abbreviation, add a
        // start-of-string match bonus.
        start_of_string_bonus = 1 //true;
      }
    }
    else {
  // Acronym Bonus
  // Weighing Logic: Typing the first character of an acronym is as if you
  // preceded it with two perfect character matches.
  if (string.charAt(index_in_string - 1) === ' ') {
    character_score += 0.8; // * Math.min(index_in_string, 5); // Cap bonus at 0.4 * 5
  }
    }

    // Left trim the already matched part of the string
    // (forces sequential matching).
    string = string.substring(index_in_string + 1, string_length);

    total_character_score += character_score;
  } // end of for loop

  // Uncomment to weigh smaller words higher.
  // return total_character_score / string_length;

  abbreviation_score = total_character_score / abbreviation_length;
  //percentage_of_matched_string = abbreviation_length / string_length;
  //word_score = abbreviation_score * percentage_of_matched_string;

  // Reduce penalty for longer strings.
  //final_score = (word_score + abbreviation_score) / 2;
  final_score = ((abbreviation_score * (abbreviation_length / string_length)) + abbreviation_score) / 2;

  final_score = final_score / fuzzies;

  if (start_of_string_bonus && (final_score + 0.15 < 1)) {
    final_score += 0.15;
  }

  return final_score;
};
