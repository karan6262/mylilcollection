$(function () {
  
   $('#e_id').on('focusout', function(){
       $.ajax({ 
        type: "POST", 
        url: "JS/checkmail.jsp", 
        data: "email="+ $('#e_id').val(),
            success: function(msg){
                $('#email-msg').html(msg);
                
            }

        });
   });
   $('#email').on('focusout', function(){
       $.ajax({ 
        type: "POST", 
        url: "JS/signmail.jsp", 
        data: "email="+ $('#email').val(),
        //dataType: 'text',
            success: function(msg){
                $('#sign-msg').html(msg);
                
            }

        });
   });
   
   
    $.validator.addMethod('pinIN',function(value,element){
        return this.optional(element)
        || value.length === 6
        && /[0-9]{6}/.test(value);
    },'Please Enter valid Pin code No');
    
    $.validator.addMethod('phoneIN',function(value,element){
        return this.optional(element)
        || value.length === 10
        && /[0-9]{10}/.test(value);  
    }, '<br/>Please Enter valid Mobile Number\'.');
    
    $.validator.addMethod('strongPassword', function(value,element) {
        return this.optional(element)
        || value.length >=6
        && /\d/.test(value)
        && /[a-z]/i.test(value);
    }, '<br/>Your password must be atleast 6 characters long and contains atleast one number and one character\'.');
    
    $("#reg-form").validate({
        rules: {
            email_id: {
                required: true,
                email: true
            },
            password:{
                required: true,
                strongPassword: true
            },
            confirm_password: {
                required : true,
                equalTo : "#pass"
            },
            firstname:{
                required : true,
                nowhitespace: true,
                lettersonly: true
            },
            
            lastname:{
                required : true,
                nowhitespace: true,
                lettersonly: true
            },
            
            contactno:{
                phoneIN: true,
                required: true,
                digits:true
            },
            
            pincode:{
                pinIN: true,
                digits: true,
                required: true
            },
            address:{
              required: true  
            }
            
            
        },
        messages: {
          
          
            email_id:{
                required: 'Please Enter an email address.',
                email: '<br/>Please Enter a <em>valid </em>Email address.'
            },
            confirm_password: {
                equalTo: "<br/>Please Enter Same Password"
            }
            
        }
    });
    
    $("#sign-frm").validate({
        rules:{
            u_email : {
                email: true,
                required: true
            },
            u_pass : {
                strongPassword: true
            }
        }
    });
    
    $("#add").validate({
       rules:{
           name:{
               required: true,
               
           },
           price:{
              // digits: true,
               required: true
           }
           
           
       } 
    });
    
});


$(function (){
    
});