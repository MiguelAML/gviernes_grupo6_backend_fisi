import nodemailer from 'nodemailer';

export const sendEmailVerify = async (subject: string, to: string, html: string) => {

    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth:{
            user: 'desarrollomovilg6@gmail.com',
            pass: 'grupo6DM'
        },
        tls: {
            rejectUnauthorized: false
        }
    });


    const mailOptions = {
        from: 'desarrollomovilg6@gmail.com',
        to: to,
        subject: subject,
        html: html,
    };

    await transporter.sendMail( mailOptions );

} 
