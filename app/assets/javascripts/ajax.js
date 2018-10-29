// $(document).on('turbolinks:load', fucntion(){
//     $("#duties-search").keyup(function() {
//         autocomplete()
//     });

// function autocomplete() {
//     $.ajax({
//         url: '/duties/ajax_search',
//         method: 'GET',
//         data: { query: $("#search-fields").val() },
//         // $("#duties-search").serialize(), //takes the form data and authenticity toke and converts it into a standard URL
//         dataType: 'json', //specify what type of data you're expecting back from the servers
//         error: function () {
//             console.log("Something went wrong");
//         },
//         success: function (data) {
//             document.querySelector('#list').innerHTML = ""
//             // $("#list").html("");

//             data.forEach(function (element) {
//                 let option = document.createElement("option");
//                 option.value = element;

//                 //append option to list
//                 $("#list").append(option);
//             });
//         }
//     });
// }
//     });